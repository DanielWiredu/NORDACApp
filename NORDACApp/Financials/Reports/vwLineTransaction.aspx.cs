using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.Shared;

namespace NORDACApp.Financials.Reports
{
    public partial class vwLineTransaction : System.Web.UI.Page
    {
        rptLineTransaction rpt = new rptLineTransaction();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LineTransactionReport_Load(object sender, EventArgs e)
        {
            string sdate = Request.QueryString["sdate"].ToString();
            string edate = Request.QueryString["edate"].ToString();

            ParameterValues parameters = new ParameterValues();
            ParameterDiscreteValue startdate = new ParameterDiscreteValue();
            ParameterDiscreteValue enddate = new ParameterDiscreteValue();

            startdate.Value = sdate;
            enddate.Value = edate;

            adapter = new SqlDataAdapter("select paydate,payee,description,transactiontype,paymode,amount from vwPaymentTransactions where paydate between '" + sdate + "' and '" + edate + "' order by paydate", connection);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "vwPaymentTransactions");
            rpt.SetDataSource(ds);

            parameters.Add(startdate);
            rpt.DataDefinition.ParameterFields["sDate"].ApplyCurrentValues(parameters);
            parameters.Add(enddate);
            rpt.DataDefinition.ParameterFields["eDate"].ApplyCurrentValues(parameters);

            LineTransactionReport.ReportSource = rpt;
        }
    }
}