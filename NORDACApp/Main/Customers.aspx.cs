using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NORDACApp.Main
{
    public partial class Customers : System.Web.UI.Page
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

        protected void dlLandSite_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            customersGrid.Rebind();
        }

        protected void customersGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Deleted Successfully', 'Success');", true);
            }
        }
    }
}