using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace NORDACApp
{
    public partial class Home : System.Web.UI.MasterPage
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUser.Text = Context.User.Identity.Name;
                spUser.InnerText = Context.User.Identity.Name;

                //getDebtors();

                getNotifications();
                if (debtors != 0)
                {
                    spDebtors.InnerText = debtors.ToString();
                    spDebtors.Visible = true;
                    lkDebtors.InnerText = debtors + " Customer(s) due for payment";
                }
                else
                {
                    spDebtors.Visible = false;
                    lkDebtors.InnerText = " Customer(s) due for payment";
                }
                if (birthdays != 0)
                {
                    lblBdays.InnerText = birthdays.ToString();
                    lblBdays.Visible = true;
                }
                else
                {
                    lblBdays.Visible = false;
                }
            }
        }

        int debtors;
        int birthdays;
        protected void getNotifications()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("spGetNotifications", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@debtors", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("@birthdays", SqlDbType.Int).Direction = ParameterDirection.Output;
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        debtors = Convert.ToInt32(command.Parameters["@debtors"].Value);
                        birthdays = Convert.ToInt32(command.Parameters["@birthdays"].Value);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                        debtors = 0;
                        birthdays = 0;
                    }
                }
            }
        }
        protected void getDebtors()
        {
            string query = "select isnull(count(CustomerId),0) as debtors from vwCustomerLastPayment where datediff(D,lastPaymentDate,getdate()) >= 30";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            int lowAssets = 0;
                            if (reader.Read())
                            {
                                lowAssets = Convert.ToInt32(reader["debtors"]);
                                if (lowAssets != 0)
                                {
                                    spDebtors.InnerText = lowAssets.ToString();
                                    spDebtors.Visible = true;
                                    lkDebtors.InnerText = lowAssets + " Customer(s) due for payment";
                                }
                                else
                                {
                                    spDebtors.Visible = false;
                                    lkDebtors.InnerText = " Customer(s) due for payment";
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Context.User.Identity.Name != lblUser.Text)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "", "toastr.error('Error occured while changing password. Please login again and retry', 'Error');", true);
                return;
            }
            byte[] hashedPassword = GetSHA1(lblUser.Text, txtPassword.Text);
            string query = "update tblUsers set UserPassword=@upass where UserName=@uname";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@upass", SqlDbType.VarBinary).Value = hashedPassword;
                    command.Parameters.Add("@uname", SqlDbType.VarChar).Value = lblUser.Text;
                    try
                    {
                        connection.Open();
                        int rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "", "toastr.success('Password Changed Successfully', 'Success');", true);
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "pop", "closepassmodal();", true);
                        }
                    }
                    catch (SqlException ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }
        /// <summary>
        /// Returns the SHA1 hash of the combined userID and password.
        /// </summary>
        /// <param name="userID"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private static byte[] GetSHA1(string userID, string password)
        {
            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
            return sha.ComputeHash(System.Text.Encoding.ASCII.GetBytes(userID + password));
        }
    }
}