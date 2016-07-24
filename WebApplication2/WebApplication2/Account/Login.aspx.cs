using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication2.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2.Account
{
    public partial class Login : Page
    {
        static string con = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        SqlConnection connection = new SqlConnection(con);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {
            bool level = false;

            if (IsValid)
            {
                
                var usename = Email.Text;
                var password = Password.Text;
                string sqlstr = @"
                select count(*)
                from [Employee]
                where [username] = '" + usename + "' and  [password] = '" + password + "';";

                // code to redirect accodring to status 
                //change
                int status = ConnectionControl(sqlstr);
                //insert sql qeury for secruity status
                //and set level
                if (status == 1 && level == false)
                {
                    Server.Transfer("~/Landing.aspx");
                }
                else if(status ==1 && level == true)
                {
                    Server.Transfer("~/Manager.aspx");
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