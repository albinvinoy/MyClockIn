using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace WebApplication2
{
    public partial class Manager : System.Web.UI.Page
    {
        #region Skip
        private string  DepartmentName;
        private int DeptID;
        // I left this from the old Manager page..not sure if you could reuse it
        DateTime TimeStart = new DateTime();
        DateTime end = new DateTime();
        int smartCount;

        // I tried to add my local database but couldn't figure it out...
        SqlConnection con = new SqlConnection(GlobalInitialization.ConnectionString);
        int EmployeeId = 100;

        protected void TextBoxEmpName_TextChanged(object sender, EventArgs e)
        {

        }
        protected void CalendarStart_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxStart.Text = CalendarStart.SelectedDate.ToShortDateString();
        }
        protected void CalendarEnd_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxEnd.Text = CalendarEnd.SelectedDate.ToShortDateString();
        }
        protected void DropRange_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void TextBoxStart_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBoxEnd_TextChanged(object sender, EventArgs e)
        {

        }
        protected string getName()
        {
            string namereturn = "";
            string sqlname = @"select [First Name] + ' ' +[Last Name] as name
from [Employee]
where lower([First Name]) like ('%" + TextBoxEmpName.Text + "%');";
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlname, con);
                namereturn = (string)cmd.ExecuteScalar();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return namereturn;
        }
        protected string getDepartment()
        {
            string getdeptname = "";
            string sqldept = @"select [Deparment Name]
from [Department]
where [Department ID] = (
select [Department_ID]
from Employee
where ([First Name] + ' ' +[Last Name]) = '" + LabelEmpName.Text + "');";

            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqldept, con);
                getdeptname = (string)cmd.ExecuteScalar();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return getdeptname;
        }
        protected int getID()
        {
            int getempid = 0;
            string sqlgetID = @"select [ID]
from Employee
where ([First Name] + ' ' +[Last Name]) = '" + LabelEmpName.Text + "';";
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlgetID, con);
                getempid = (int)cmd.ExecuteScalar();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return getempid;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            // Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            // ACTUAL DATA NEEDS TO BE PULLED FROM DATABASE
            LabelEmpName.Text = getName().ToString();
            LabelEmpId.Text = getID().ToString();
            LabelEmpDept.Text = getDepartment().ToString();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            if (DropRange.SelectedIndex == 1)
            {
                // Daily Search
            }
            else if (DropRange.SelectedIndex == 2)
            {
                // Weekly Search
            }
            else if (DropRange.SelectedIndex == 3)
            {
                // Monthly Search
            }
            else
            {
                // Select Range = Default/Place Holder
            }
        }

        protected void ChartPayroll_Customize(object sender, EventArgs e)
        {
        }

        private LegendCellColumn LegendCellColumn()
        {
            throw new NotImplementedException();
        }
    }

}