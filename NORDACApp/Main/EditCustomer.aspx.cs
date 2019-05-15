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

namespace NORDACApp.Main
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string customerId = Request.QueryString["customerId"].ToString();
                string query = "select * from tblCustomers where Id = @Id";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.Add("@Id", SqlDbType.Int).Value = customerId;
                        try
                        {
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                dlLandSite.SelectedValue = reader["landsiteId"].ToString();
                                dpRegdate.SelectedDate = Convert.ToDateTime(reader["registrationdate"]);
                                txtCustomerId.Text = reader["Id"].ToString();
                                txtFirstname.Text = reader["firstname"].ToString();
                                txtOthernames.Text = reader["othernames"].ToString();
                                dpDateOfBirth.SelectedDate = Convert.ToDateTime(reader["DateOfBirth"]);
                                txtTelephone1.Text = reader["telephone1"].ToString();
                                txtTelephone2.Text = reader["telephone2"].ToString();
                                txtEmailAddress.Text = reader["emailaddress"].ToString();
                                txtPlotNo.Text = reader["plotno"].ToString();
                                txtPostalAddress.Text = reader["postaladdress"].ToString();
                                txtResidentialAddress.Text = reader["residentialaddress"].ToString();
                                txtInitialDeposit.Text = reader["initialdepositamt"].ToString();
                                dlPaymentDuration.SelectedText = reader["paymentduration"].ToString();
                                dlPaymentPlan.SelectedText = reader["paymentplan"].ToString();
                                txtOccupation.Text = reader["occupation"].ToString();
                                txtReferredBy.Text = reader["referredby"].ToString();
                                txtRemarks.Text = reader["remarks"].ToString();
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void productsGrid_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
            }
        }

        protected void productsGrid_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Updated Successfully', 'Success');", true);
            }
        }

        protected void productsGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
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

        protected void paymentGrid_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
            }
        }

        protected void paymentGrid_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + e.Exception.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Updated Successfully', 'Success');", true);
            }
        }

        protected void paymentGrid_ItemDeleted(object sender, GridDeletedEventArgs e)
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spUpdateCustomer", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@LandSiteId", SqlDbType.Int).Value = dlLandSite.SelectedValue;
                    command.Parameters.Add("@RegistrationDate", SqlDbType.DateTime).Value = dpRegdate.SelectedDate;
                    command.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstname.Text;
                    command.Parameters.Add("@Othernames", SqlDbType.VarChar).Value = txtOthernames.Text;
                    command.Parameters.Add("@PostalAddress", SqlDbType.VarChar).Value = txtPostalAddress.Text;
                    command.Parameters.Add("@ResidentialAddress", SqlDbType.VarChar).Value = txtResidentialAddress.Text;
                    command.Parameters.Add("@EmailAddress", SqlDbType.VarChar).Value = txtEmailAddress.Text;
                    command.Parameters.Add("@Telephone1", SqlDbType.VarChar).Value = txtTelephone1.Text;
                    command.Parameters.Add("@Telephone2", SqlDbType.VarChar).Value = txtTelephone2.Text;
                    command.Parameters.Add("@InitialDepositAmt", SqlDbType.Float).Value = txtInitialDeposit.Text;
                    command.Parameters.Add("@PaymentDuration", SqlDbType.VarChar).Value = dlPaymentDuration.SelectedText;
                    command.Parameters.Add("@PaymentPlan", SqlDbType.VarChar).Value = dlPaymentPlan.SelectedText;
                    command.Parameters.Add("@Occupation", SqlDbType.VarChar).Value = txtOccupation.Text;
                    command.Parameters.Add("@ReferredBy", SqlDbType.VarChar).Value = txtReferredBy.Text;
                    command.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemarks.Text;
                    command.Parameters.Add("@PlotNo", SqlDbType.VarChar).Value = txtPlotNo.Text;
                    command.Parameters.Add("@DateOfBirth", SqlDbType.DateTime).Value = dpDateOfBirth.SelectedDate;
                    command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = txtCustomerId.Text;
                    command.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        int retVal = Convert.ToInt16(command.Parameters["@return_value"].Value);
                        if (retVal == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Customer Updated Successfully', 'Success');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void productsGrid_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item.IsInEditMode)
            {
                GridEditableItem item = e.Item as GridEditableItem;
                GridEditManager manager = item.EditManager;
                if (!(e.Item is GridDataInsertItem))   //(!(e.Item is  GridDataInsertItem))
                {
                    GridEditableItem editItem = (GridEditableItem)e.Item;
                    DropDownList drList = (DropDownList)item.FindControl("dlProductType");
                    drList.Enabled = false;
                }
                else
                {
                    GridNumericColumnEditor unitprice = manager.GetColumnEditor("UnitPrice") as GridNumericColumnEditor;
                    unitprice.NumericTextBox.Enabled = false;
                }
               

                //GridTextBoxColumnEditor doctext = manager.GetColumnEditor("R_DOCTEXT") as GridTextBoxColumnEditor;
                //doctext.TextBoxControl.Width = Unit.Pixel(400);
                //doctext.TextBoxControl.TextMode = TextBoxMode.MultiLine;
                //doctext.TextBoxControl.Rows = 10;
            }
        }

        protected void dlPaymentMode_ItemSelected(object sender, DropDownListEventArgs e)
        {
            if (dlPaymentMode.SelectedText == "Cheque" || dlPaymentMode.SelectedText == "Mobile Money")
                txtChequeno.Enabled = true;
            else
            {
                txtChequeno.Enabled = false;
                txtChequeno.Text = "";
            }
        }

        protected void dlPaymentMode1_ItemSelected(object sender, DropDownListEventArgs e)
        {
            if (dlPaymentMode1.SelectedText == "Cheque" || dlPaymentMode1.SelectedText == "Mobile Money")
                txtChequeno1.Enabled = true;
            else
            {
                txtChequeno1.Enabled = false;
                txtChequeno1.Text = "";
            }
        }

        protected void btnSavePayment_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO tblPayments(CustomerId, PaymentDate, PaymentMode, ChequeNo, Amount, CreatedBy) VALUES(@CustomerId, @PaymentDate, @PaymentMode, @ChequeNo, @Amount, @CreatedBy)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = txtCustomerId.Text;
                    command.Parameters.Add("@PaymentDate", SqlDbType.DateTime).Value = dpPaymentDate.SelectedDate;
                    command.Parameters.Add("@PaymentMode", SqlDbType.VarChar).Value = dlPaymentMode.SelectedText;
                    command.Parameters.Add("@ChequeNo", SqlDbType.VarChar).Value = txtChequeno.Text;
                    command.Parameters.Add("@Amount", SqlDbType.Float).Value = txtAmount.Text;
                    command.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = User.Identity.Name;
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Saved Successfully', 'Success');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closenewModal();", true);
                            paymentGrid.Rebind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void btnUpdatePayment_Click(object sender, EventArgs e)
        {
            string query = "UPDATE tblPayments SET PaymentDate = @PaymentDate, PaymentMode = @PaymentMode, ChequeNo = @ChequeNo, Amount = @Amount WHERE (Id = @Id)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@PaymentDate", SqlDbType.DateTime).Value = dpPaymentDate1.SelectedDate;
                    command.Parameters.Add("@PaymentMode", SqlDbType.VarChar).Value = dlPaymentMode1.SelectedText;
                    command.Parameters.Add("@ChequeNo", SqlDbType.VarChar).Value = txtChequeno1.Text;
                    command.Parameters.Add("@Amount", SqlDbType.Float).Value = txtAmount1.Text;
                    command.Parameters.Add("@Id", SqlDbType.Int).Value = ViewState["PaymentId"].ToString();
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('Updated Successfully', 'Success');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "closeeditModal();", true);
                            paymentGrid.Rebind();
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void paymentGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                GridDataItem item = e.Item as GridDataItem;
                ViewState["PaymentId"] = item["Id"].Text;
                dpPaymentDate1.SelectedDate = Convert.ToDateTime(item["paymentdate"].Text);
                dlPaymentMode1.SelectedText = item["paymentmode"].Text;
                if (dlPaymentMode1.SelectedText == "Cheque" || dlPaymentMode1.SelectedText == "Mobile Money")
                    txtChequeno1.Enabled = true;
                else
                    txtChequeno1.Enabled = false;
                txtChequeno1.Text = item["chequeno"].Text;
                txtAmount1.Text = item["amount"].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "editModal();", true);
                e.Canceled = true;
            }
            else if (e.CommandName == "InitInsert")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "newModal();", true);
                e.Canceled = true;
            }
        }

        //protected void productSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        //{
        //    // Remove unneeded parameter
        //    e.Command.Parameters.Remove(e.Command.Parameters["@UnitPrice"]);
        //}
    }
}