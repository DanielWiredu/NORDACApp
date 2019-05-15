using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NORDACApp.Reports
{
    public partial class AllReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string customerId = dlCustomer.SelectedValue;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "newTab", "window.open('/Reports/vwClientStatement.aspx?customerId=" + customerId + "');", true);
        }
        protected void dlCustomer_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = ((DataRowView)e.Item.DataItem)["CustomerName"].ToString() + " - " + ((DataRowView)e.Item.DataItem)["Id"].ToString();
            e.Item.Value = ((DataRowView)e.Item.DataItem)["Id"].ToString();
        }

        protected void dlCustomer_DataBound(object sender, EventArgs e)
        {
            //set the initial footer label
            ((Literal)dlCustomer.Footer.FindControl("customerCount")).Text = Convert.ToString(dlCustomer.Items.Count);
        }

        protected void dlCustomer_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            String sql = "SELECT top (30) Id, CustomerName FROM [vwCustomers] WHERE (CustomerName LIKE '%" + e.Text.ToUpper() + "%')";
            customerSource.SelectCommand = sql;
            dlCustomer.DataBind();
        }
    }
}