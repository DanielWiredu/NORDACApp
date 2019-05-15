using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NORDACApp.Financials.Reports
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpSdate.SelectedDate = DateTime.UtcNow;
                dpEdate.SelectedDate = DateTime.UtcNow;
                dpPeriod.SelectedDate = DateTime.UtcNow;
            }
        }
        protected void btnReport_Click(object sender, EventArgs e)
        {
            string sdate = dpSdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            string edate = dpEdate.SelectedDate.Value.ToString("dd-MMM-yyyy");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Financials/Reports/vwLineTransaction.aspx?sdate=" + sdate + "&edate=" + edate + "');", true);
        }

        protected void btnReportSummary_Click(object sender, EventArgs e)
        {
            string period = "";
            if (rdType.SelectedValue == "Monthly")
                period = dpPeriod.SelectedDate.Value.ToString("yyyyMM");
            else if (rdType.SelectedValue == "Yearly")
                period = dpPeriod.SelectedDate.Value.ToString("yyyy");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Financials/Reports/vwSummaryTransaction.aspx?period=" + period + "');", true);
        }
    }
}