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
    public partial class EditPaymentTransaction : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["transId"] = Request.QueryString["transId"].ToString();
                string query = "select * from tblPaymentTransactions where Id = @transId";
                using  (SqlConnection connection =  new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@transId", SqlDbType.Int).Value = ViewState["transId"].ToString();
                        try
                        {
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                txtPVNo.Text = reader["pvno"].ToString();
                                dpPaydate.SelectedDate = Convert.ToDateTime(reader["paydate"]);
                                txtPayee.Text = reader["payee"].ToString();
                                dlBank.SelectedValue = reader["bankid"].ToString();
                                dlDescription.SelectedValue = reader["transactiontypeid"].ToString();
                                dlPaymode.SelectedText = reader["paymode"].ToString();
                                txtAmount.Text = reader["amount"].ToString();
                                txtChequeno.Text = reader["chequeno"].ToString();
                                txtRemarks.Text = reader["remarks"].ToString();
                                txtReceivedBy.Text = reader["receivedby"].ToString();

                                if (dlPaymode.SelectedText == "Cash")
                                {
                                    dlBank.ClearSelection();
                                    dlBank.Enabled = false;
                                    txtChequeno.Enabled = false;
                                }
                                else
                                {
                                    dlBank.Enabled = true;
                                    txtChequeno.Enabled = true;
                                }
                            }
                            else
                            {
                                btnSave.Enabled = false;
                            }
                            reader.Close();
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                        }
                    }
                }
            }
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

            string query = "update tblPaymentTransactions set paydate=@paydate,payee=@payee,bankid=@bankid,transactiontypeid=@transactiontypeid,paymode=@paymode,amount=@amount,chequeno=@chequeno,remarks=@remarks,receivedby=@receivedby where Id = @Id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    //command.Parameters.Add("@pvno", SqlDbType.VarChar).Value = txtPVNo.Text;
                    command.Parameters.Add("@paydate", SqlDbType.DateTime).Value = dpPaydate.SelectedDate;
                    command.Parameters.Add("@payee", SqlDbType.VarChar).Value = txtPayee.Text;
                    command.Parameters.Add("@bankid", SqlDbType.Int).Value = bankId;
                    command.Parameters.Add("@transactiontypeid", SqlDbType.Int).Value = dlDescription.SelectedValue;
                    command.Parameters.Add("@paymode", SqlDbType.VarChar).Value = dlPaymode.SelectedText;
                    command.Parameters.Add("@amount", SqlDbType.Float).Value = txtAmount.Text;
                    command.Parameters.Add("@chequeno", SqlDbType.VarChar).Value = txtChequeno.Text;
                    command.Parameters.Add("@remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                    command.Parameters.Add("@receivedby", SqlDbType.VarChar).Value = txtReceivedBy.Text;
                    command.Parameters.Add("@Id", SqlDbType.Int).Value = ViewState["transId"].ToString();
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Changes Saved Successfully', 'Success');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }
    }
}