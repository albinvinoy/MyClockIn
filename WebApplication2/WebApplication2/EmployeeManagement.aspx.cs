using System;
using System.Collections.Generic;
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class EmployeeManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        #region DeleteThese
        protected void TextBoxEmpId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxFirst_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxLast_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxUsername_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxPay_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropSecurity_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxDept_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxPhone_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBoxNotes_TextChanged(object sender, EventArgs e)
        {

        }

        #endregion

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(GlobalInitialization.ConnectionString);
            string sqladdempstirng = @"
INSERT INTO [dbo].[Employee]
           ([ID]
           ,[Last Name]
           ,[First Name]
           ,[Phone Number]
           ,[Email]
           ,[Pay Rate]
           ,[username]
           ,[password]
           ,[Security Level]
           ,[Notes]
           ,[Department_ID]) 
Values(
   @_ID
  ,@_LastName
  ,@_FirstName
  ,@_PhoneNum
  ,@_Email
  ,@_PayRate
  ,@_UserName
  ,@_Password
  ,@_SecuirtyLvl
  ,@_Notes
  ,@_DepartmentFK
)
";
            SqlCommand cmd = new SqlCommand(sqladdempstirng, conn);
            cmd.Parameters.Add("@_ID", SqlDbType.Int).Value = TextBoxEmpId.Text;
            cmd.Parameters.Add("@_LastName", SqlDbType.VarChar).Value = TextBoxLast.Text;
            cmd.Parameters.Add("@_FirstName", SqlDbType.VarChar).Value = TextBoxFirst.Text;
            cmd.Parameters.Add("@_PhoneNum", SqlDbType.Char).Value = TextBoxPhone.Text;
            cmd.Parameters.Add("@_Email", SqlDbType.VarChar).Value = TextBoxEmail.Text;
            cmd.Parameters.Add("@_PayRate", SqlDbType.Float).Value = TextBoxPay.Text;
            cmd.Parameters.Add("@_UserName", SqlDbType.VarChar).Value = TextBoxUsername.Text;
            cmd.Parameters.Add("@_Password", SqlDbType.VarChar).Value = TextBoxPassword.Text;
            cmd.Parameters.Add("@_SecuirtyLvl", SqlDbType.TinyInt).Value = DropSecurity.Text;
            cmd.Parameters.Add("@_Notes", SqlDbType.Char).Value = TextBoxNotes.Text;
            cmd.Parameters.Add("@_DepartmentFK", SqlDbType.Int).Value = TextBoxDept.Text;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

       
    }
}