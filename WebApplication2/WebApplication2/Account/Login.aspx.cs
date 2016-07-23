using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication2.Models;
using System.Data.SqlClient;

namespace WebApplication2.Account
{
    public partial class Login : Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename=D:\Users\Albin\dummy.mdf;Integrated Security = True;");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {

            if (IsValid)
            {
                
                var usename = Email.Text;
                var password = Password.Text;
                string sqlstr = @"
                select count(*)
                from [Employee]
                where [username] = '" + usename + "' and  [password] = '" + password + "';";

                // code to redirect accodring to status 
                int status = ConnectionControl(sqlstr);
                if (status == 1)
                {
                    Server.Transfer("~/Landing.aspx");
                }
                else
                {
                    FailureText.Text = "Invalid login attempt";
                    ErrorMessage.Visible = true;
                }
                
            }
        }

        private int ConnectionControl(string cmd)
        {
            SqlCommand command = new SqlCommand(cmd, connection);
            int connected = 0;
            try
            {
                connection.Open();
                connected = (Int32)command.ExecuteScalar();

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return connected;
        }
    }
}