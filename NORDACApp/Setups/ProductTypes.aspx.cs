using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace NORDACApp.Setups
{
    public partial class ProductTypes : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query = "insert into tblProductTypes(ProductType,UnitPrice) values(@ProductType,@UnitPrice)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@ProductType", SqlDbType.VarChar).Value = txtProductType.Text;
                    command.Parameters.Add("@UnitPrice", SqlDbType.Float).Value = txtUnitPrice.Text;
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                            productTypeGrid.Rebind();
                            txtProductType.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Product Type already exist', 'Error');", true);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string query = "update tblProductTypes set ProductType=@ProductType, UnitPrice=@UnitPrice where Id = @Id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@ProductType", SqlDbType.VarChar).Value = txtProductType1.Text;
                    command.Parameters.Add("@UnitPrice", SqlDbType.Float).Value = txtUnitPrice1.Text;
                    command.Parameters.Add("@Id", SqlDbType.Int).Value = ViewState["Id"].ToString();
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Updated Successfully', 'Success');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditModal();", true);
                            productTypeGrid.Rebind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Product Type already exist', 'Error');", true);
                    }
                }
            }
        }
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            productTypeGrid.MasterTableView.ExportToExcel();
        }

        protected void btnPDFExport_Click(object sender, EventArgs e)
        {
            productTypeGrid.MasterTableView.ExportToPdf();
        }

        protected void productTypeGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
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

        protected void productTypeGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["Id"] = item["Id"].Text;
                txtProductType1.Text = item["ProductType"].Text;
                txtUnitPrice1.Text = item["UnitPrice"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editModal();", true);
                e.Canceled = true;
            }
        }
    }
}