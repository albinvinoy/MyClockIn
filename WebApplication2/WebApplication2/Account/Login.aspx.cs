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
        SqlConnection connection = new SqlConnection(GlobalInitialization.ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
        }

        protected void LogIn(object sender, EventArgs e)
        {
            byte level = byte.MaxValue;

            if (IsValid)
            {

                // Begin code to check for log in
                var usename = Email.Text;
                var password = Password.Text;
                string sqllogin = @"
                select count(*)
                from [Employee]
                where [username] = '" + usename + "' and  [password] = '" +
                password + "';";

                GlobalInitialization.LoginStatus = ConnectionControl(sqllogin);
                // End code to check for log in

                if (GlobalInitialization.LoginStatus == 1)
                {
                    // Begin fetch user ID
                    string sqlID = @"
                select [ID]
                from [Employee]
                where [username] = '" + usename + "' and  [password] = '" + password + "';";

                    GlobalInitialization.ID = ConnectionControl(sqlID);
                    //End user ID

                    // Begin fetch Security Level
                    string sqlSecurityLevel = @"
                select [Security Level]
                from [Employee]
                where [ID] = '" + GlobalInitialization.ID + "';";

                    level = getSecurityLevel(sqlSecurityLevel);
                    // End fetch Security Level
                }
                // Begin transfer to appropriate page
                if (GlobalInitialization.LoginStatus == 1 && level == 1)
                {
                    GlobalInitialization.log = true;
                    Server.Transfer("~/Landing.aspx");
                }
                else if (GlobalInitialization.LoginStatus == 1 && level == 2)
                {
                    GlobalInitialization.log = true;
                    GlobalInitialization.manager = true;
                    Server.Transfer("~/Manager.aspx");
                }
                else
                {
                    Message.Text = "Invalid login attempt";
                }
                // End transfer to appropriate page
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

        private byte getSecurityLevel(string cmd)
        {
             SqlCommand command = new SqlCommand(cmd, connection);
         byte SeLvl = byte.MaxValue;
            try
            {
                connection.Open();
              SeLvl = (byte)command.ExecuteScalar();
            }
            catch (SqlException ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return SeLvl;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            byte level = byte.MaxValue;

            if (IsValid)
            {

                // Begin code to check for log in
                var usename = Email.Text;
                var password = Password.Text;
                string sqllogin = @"
                select count(*)
                from [Employee]
                where [username] = '" + usename + "' and  [password] = '" + password + "';";

                GlobalInitialization.LoginStatus = ConnectionControl(sqllogin);
                // End code to check for log in

                if (GlobalInitialization.LoginStatus == 1)
                {
                    // Begin fetch user ID
                    string sqlID = @"
                select [ID]
                from [Employee]
                where [username] = '" + usename + "' and  [password] = '" + password + "';";

                    GlobalInitialization.ID = ConnectionControl(sqlID);
                    //End user ID

                    // Begin fetch Security Level
                    string sqlSecurityLevel = @"
                select [Security Level]
                from [Employee]
                where [ID] = '" + GlobalInitialization.ID + "';";

                    level = getSecurityLevel(sqlSecurityLevel);
                    // End fetch Security Level
                }
                // Begin transfer to appropriate page
                if (GlobalInitialization.LoginStatus == 1 && level == 1)
                {
                    Server.Transfer("~/Landing.aspx");
                }
                else if (GlobalInitialization.LoginStatus == 1 && level == 2)
                {
                    Server.Transfer("~/Manager.aspx");
                }
                else
                {
                    Message.Text = "Invalid login attempt";
                }
                // End transfer to appropriate page
            }
        }
    }
}