using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NORDACApp.Reports
{
    public partial class vwProductBalances : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            customersGrid.MasterTableView.ExportToExcel();
        }
        protected void dlLandSite_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            customersGrid.Rebind();
        }
    }
}