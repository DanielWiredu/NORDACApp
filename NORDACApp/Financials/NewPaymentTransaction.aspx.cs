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

namespace NORDACApp.Financials
{
    public partial class NewPaymentTransaction : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void dlPaymode_ItemSelected(object sender, DropDownListEventArgs e)
        {
            if (dlPaymode.SelectedText == "Cash")
            {
                dlBank.ClearSelection();
                dlBank.Enabled = false;
                txtChequeno.Text = "";
                txtChequeno.Enabled = false;
            }
            else if (dlPaymode.SelectedText == "Cheque" || dlPaymode.SelectedText == "Mobile Money")
            {
                dlBank.Enabled = true;
                txtChequeno.Enabled = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string bankId = "0";
            if (!String.IsNullOrEmpty(dlBank.SelectedValue))
                bankId = dlBank.SelectedValue;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spAddPaymentTransaction", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@pvno", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@paydate", SqlDbType.DateTime).Value = dpPaydate.SelectedDate;
                    command.Parameters.Add("@payee", SqlDbType.VarChar).Value = txtPayee.Text;
                    command.Parameters.Add("@bankid", SqlDbType.Int).Value = bankId;
                    command.Parameters.Add("@transactiontypeid", SqlDbType.Int).Value = dlDescription.SelectedValue;
                    command.Parameters.Add("@paymode", SqlDbType.VarChar).Value = dlPaymode.SelectedText;
                    command.Parameters.Add("@amount", SqlDbType.Float).Value = txtAmount.Text;
                    command.Parameters.Add("@chequeno", SqlDbType.VarChar).Value = txtChequeno.Text;
                    command.Parameters.Add("@remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                    command.Parameters.Add("@preparedby", SqlDbType.VarChar).Value = Context.User.Identity.Name;
                    command.Parameters.Add("@receivedby", SqlDbType.VarChar).Value = txtReceivedBy.Text;
                    command.Parameters.Add("@payyyyymm", SqlDbType.VarChar).Value = dpPaydate.SelectedDate.Value.ToString("yyyyMM");
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retVal = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        if (retVal == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
                            btnSave.Enabled = false;
                            txtPVNo.Text = command.Parameters["@pvno"].Value.ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}