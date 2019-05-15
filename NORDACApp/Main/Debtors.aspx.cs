using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NORDACApp.Main
{
    public partial class Debtors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dlLandSite_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            debtorsGrid.Rebind();
        }
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            debtorsGrid.MasterTableView.ExportToExcel();
        }
    }
}