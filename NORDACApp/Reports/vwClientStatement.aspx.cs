using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.Net.Mail;

namespace NORDACApp.Reports
{
    public partial class vwClientStatement : System.Web.UI.Page
    {
        rptClientStatement rpt = new rptClientStatement();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter;
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            loadClientStatement();
        }
        protected void loadClientStatement()
        {
            string customerId = Request.QueryString["customerId"].ToString();

            adapter = new SqlDataAdapter("select * from vwCustomerPayments where customerId = '" + customerId + "'", connection);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            adapter.Fill(ds, "vwCustomerPayments");
            rpt.SetDataSource(ds);

            ClientStatementReport.ReportSource = rpt;

            Logininfo();

            //rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Context.Response, false, String.Empty);
        }
        private void ConfigureCrystalReports()
        {
            //string reportPath = Server.MapPath("~/rptClientStatement.rpt");

            ConnectionInfo connectionInfo = new ConnectionInfo();

            connectionInfo.ServerName = ConfigurationManager.AppSettings["ServerName"];
            connectionInfo.DatabaseName = ConfigurationManager.AppSettings["DatabaseName"];
            connectionInfo.UserID = ConfigurationManager.AppSettings["UserName"];
            connectionInfo.Password = ConfigurationManager.AppSettings["Password"];
            ClientStatementReport.ReportSource = rpt;
            SetDBLogonForReport(connectionInfo);
        }
        private void SetDBLogonForReport(ConnectionInfo connectionInfo)
        {
            TableLogOnInfos tableLogOnInfos = ClientStatementReport.LogOnInfo;
            foreach (TableLogOnInfo tableLogOnInfo in tableLogOnInfos)
            {
                tableLogOnInfo.ConnectionInfo = connectionInfo;
            }
        }
        protected void ClientStatementReport_Load(object sender, EventArgs e)
        {
            string customerId = Request.QueryString["customerId"].ToString();

            adapter = new SqlDataAdapter("select * from vwCustomerPayments where customerId = '" + customerId + "'", connection);
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            adapter.Fill(ds, "vwCustomerPayments");
            rpt.SetDataSource(ds);

            ClientStatementReport.ReportSource = rpt;

            Logininfo();

            //adapter.Dispose();
            //connection.Close();
        }
        private void Logininfo()
        {
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            crtableLogoninfo.ConnectionInfo.IntegratedSecurity = false;
            
            //ConnectionInfo crConnectionInfo = new ConnectionInfo();
            //Tables CrTables;
            ClientStatementReport.LogOnInfo = new CrystalDecisions.Shared.TableLogOnInfos();
            //ReportDocument myreport = new ReportDocument();
            //CrTables = myreport.Database.Tables;
            //CrTables = rpt.Database.Tables;
            //foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
            //{
            //    crtableLogoninfo.ConnectionInfo.ServerName = ConfigurationManager.AppSettings["ServerName"];
            //    crtableLogoninfo.ConnectionInfo.DatabaseName = ConfigurationManager.AppSettings["DatabaseName"];
            //    crtableLogoninfo.ConnectionInfo.UserID = ConfigurationManager.AppSettings["UserName"];
            //    crtableLogoninfo.ConnectionInfo.Password = ConfigurationManager.AppSettings["Password"];

            //    CrTable.ApplyLogOnInfo(crtableLogoninfo);
            //}
            foreach (ReportDocument subreport in rpt.Subreports)
            {
                foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in subreport.Database.Tables)
                {
                    crtableLogoninfo = CrTable.LogOnInfo;
                    //crtableLogoninfo.ConnectionInfo = EPAKconnectionInfo;
                    crtableLogoninfo.ConnectionInfo.ServerName = ConfigurationManager.AppSettings["ServerName"];
                    crtableLogoninfo.ConnectionInfo.DatabaseName = ConfigurationManager.AppSettings["DatabaseName"];
                    crtableLogoninfo.ConnectionInfo.UserID = ConfigurationManager.AppSettings["UserName"];
                    crtableLogoninfo.ConnectionInfo.Password = ConfigurationManager.AppSettings["Password"];
                    CrTable.ApplyLogOnInfo(crtableLogoninfo);
                }
            }
            ClientStatementReport.LogOnInfo.Add(crtableLogoninfo);
        }

        protected void btnSendStatement_Click(object sender, EventArgs e)
        {
            string customerId = Request.QueryString["customerId"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("select firstname, emailaddress from tblCustomers where Id=@Id", connection))
                {
                    command.Parameters.Add("@Id", SqlDbType.Int).Value = customerId;
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            string firstname = reader["firstname"].ToString();
                            string clientEmail = reader["emailaddress"].ToString();
                            sendEmail(firstname, clientEmail);
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "');", true);
                    }
                }
            }
        }
        protected void sendEmail(string clientName, string emailAddress)
        {
            try
            {
                string mailSubject = "CLIENT STATEMENT - NORDARC ESTATES";
                string message = "Dear " + clientName + ", <br><br>";
                message += "Please find attached your statement for payment of your land(s) with  <strong>NORDARC ESTATES LIMITED</strong>. <br><br> ";
                message += "Thank you <br><br><br>";
                message += "<strong>If you find any discrepancy in your statement, kindly contact us via phone or email within three(3) working days.</strong>";
                MailMessage myMessage = new MailMessage();
                myMessage.From = (new MailAddress("business@nordarcestates.com", "Nordarc Estates"));
                myMessage.To.Add(new MailAddress(emailAddress));
                myMessage.Subject = mailSubject;
                myMessage.Body = message;
                myMessage.Attachments.Add(new Attachment(rpt.ExportToStream(ExportFormatType.PortableDocFormat), "ClientStatement.pdf"));
                myMessage.IsBodyHtml = true;
                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mailsuccess", "alert('Email Sent Successfully');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mailerror", "alert('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "');", true);
            }
        }
    }
}