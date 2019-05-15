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
    public partial class LandSites : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query = "insert into tblLandSites(LandSite) values(@LandSite)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@LandSite", SqlDbType.VarChar).Value = txtLandSite.Text;
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                            landSiteGrid.Rebind();
                            txtLandSite.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Land site already exist', 'Error');", true);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string query = "update tblLandSites set LandSite=@LandSite where Id = @Id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@LandSite", SqlDbType.VarChar).Value = txtLandSite1.Text;
                    command.Parameters.Add("@Id", SqlDbType.Int).Value = ViewState["Id"].ToString();
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Updated Successfully', 'Success');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditModal();", true);
                            landSiteGrid.Rebind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('Land site already exist', 'Error');", true);
                    }
                }
            }
        }
        protected void btnExcelExport_Click(object sender, EventArgs e)
        {
            landSiteGrid.MasterTableView.ExportToExcel();
        }

        protected void btnPDFExport_Click(object sender, EventArgs e)
        {
            landSiteGrid.MasterTableView.ExportToPdf();
        }

        protected void landSiteGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
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

        protected void landSiteGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["Id"] = item["Id"].Text;
                txtLandSite1.Text = item["LandSite"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editModal();", true);
                e.Canceled = true;
            }
        }
    }
}