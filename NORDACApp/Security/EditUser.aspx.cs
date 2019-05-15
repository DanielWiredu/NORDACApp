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
using Telerik.Web.UI;

namespace NORDACApp.Security
{
    public partial class EditUser : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT * FROM tblUsers WHERE id = '" + Session["eUserid"].ToString() + "'";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        try
                        {
                            connection.Open();
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    ViewState["id"] = reader["id"].ToString();
                                    txtUsername.Text = reader["Username"].ToString();
                                    dlRole.SelectedText = reader["Userroles"].ToString();
                                    txtFullname.Text = reader["Fullname"].ToString();
                                    dlGender.SelectedText = reader["Gender"].ToString();
                                    dlMaritalStatus.SelectedText = reader["MaritalStatus"].ToString();
                                    txtMobile.Text = reader["ContactNo"].ToString();
                                    txtEmail.Text = reader["Email"].ToString();
                                    dlPost.SelectedText = reader["PostType"].ToString();
                                    txtAddress.Text = reader["Address"].ToString();
                                    chkActive.Checked = Convert.ToBoolean(reader["Active"]);
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
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            byte[] hashedPassword = GetSHA1(txtUsername.Text, txtPassword.Text);

            string query = "Update tblUsers SET username=@uname,userpassword=@upass,userroles=@uroles,fullname=@fname,gender=@gender,maritalstatus=@mstatus,contactno=@contactno,email=@email,posttype=@post,address=@address,active=@active WHERE id=@id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@uname", SqlDbType.VarChar).Value = txtUsername.Text;
                    command.Parameters.Add("@upass", SqlDbType.VarBinary).Value = hashedPassword;
                    command.Parameters.Add("@uroles", SqlDbType.VarChar).Value = dlRole.SelectedText;
                    command.Parameters.Add("@fname", SqlDbType.VarChar).Value = txtFullname.Text;
                    command.Parameters.Add("@gender", SqlDbType.VarChar).Value = dlGender.SelectedText;
                    command.Parameters.Add("@mstatus", SqlDbType.VarChar).Value = dlMaritalStatus.SelectedText;
                    command.Parameters.Add("@contactno", SqlDbType.VarChar).Value = txtMobile.Text;
                    command.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text;
                    command.Parameters.Add("@post", SqlDbType.VarChar).Value = dlPost.SelectedText;
                    command.Parameters.Add("@address", SqlDbType.VarChar).Value = txtAddress.Text;
                    command.Parameters.Add("@active", SqlDbType.TinyInt).Value = chkActive.Checked;
                    command.Parameters.Add("@id", SqlDbType.Int).Value = int.Parse(ViewState["id"].ToString());
                    try
                    {
                        connection.Open();
                        rows = command.ExecuteNonQuery();
                        if (rows == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.success('User Updated Successfully', 'Success');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "toastr.error('" + ex.Message.Replace("'", "").Replace("\r\n", "") + "', 'Error');", true);
                    }
                }
            }
        }

        private static byte[] GetSHA1(string userID, string password)
        {
            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
            return sha.ComputeHash(System.Text.Encoding.ASCII.GetBytes(userID + password));
        }
    }
}