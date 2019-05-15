using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NORDACApp.Main
{
    public partial class Birthdays : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void customersGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                Response.Redirect("/Main/EditCustomer.aspx?customerId=" + item["ID"].Text);
            }
        }

        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            customersGrid.MasterTableView.ExportToExcel();
        }
    }
}