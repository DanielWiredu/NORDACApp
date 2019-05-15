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
    public partial class vwSummaryTransaction : System.Web.UI.Page
    {
        rptSummaryTransaction rpt = new rptSummaryTransaction();
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SummaryTransactionReport_Load(object sender, EventArgs e)
        {
            string yyyymm = Request.QueryString["period"].ToString();

            ParameterValues parameters = new ParameterValues();
            ParameterDiscreteValue payyyyymm = new ParameterDiscreteValue();
            ParameterDiscreteValue paycur = new ParameterDiscreteValue();

            payyyyymm.Value = yyyymm;

            adapter = new SqlDataAdapter("select * from MonthlyStatement where payyyyymm like '" + yyyymm + "%' order by payyyyymm", connection);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds, "MonthlyStatement");
            rpt.SetDataSource(ds);

            parameters.Add(payyyyymm);
            rpt.DataDefinition.ParameterFields["payyyyymm"].ApplyCurrentValues(parameters);

            SummaryTransactionReport.ReportSource = rpt;
        }
    }
}