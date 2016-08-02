using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Configuration;

namespace WebApplication2
{
    public partial class Manager : System.Web.UI.Page
    {
        #region Skip

         string DepartmentName;
        int EmployeeID;
        // I left this from the old Manager page..not sure if you could reuse it
        DateTime TimeStart = new DateTime();
        DateTime Timend = new DateTime();
       

        // I tried to add my local database but couldn't figure it out...
        SqlConnection con = new SqlConnection(GlobalInitialization.ConnectionString);
        protected void TextBoxEmpName_TextChanged(object sender, EventArgs e)
        {
            TextBoxEmpName.Dispose();
        }
        protected void CalendarStart_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxStart.Text = CalendarStart.SelectedDate.ToShortDateString();
            TimeStart = CalendarStart.SelectedDate;
        }
        protected void CalendarEnd_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxEnd.Text = CalendarEnd.SelectedDate.ToShortDateString();
            Timend = CalendarEnd.SelectedDate;
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

            try
            {
                con.Open();
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
            // If null returns
            if (namereturn == null)
            {
                return namereturn = "";
            }
            else
            {
                return namereturn;
            }
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

            SqlCommand cmd = new SqlCommand(sqlgetID, con);
            getempid = (int)cmd.ExecuteScalar();

            con.Close();
            return getempid;
        }

        protected void ChartPayroll_Customize(object sender, EventArgs e)
        {
        }

        private LegendCellColumn LegendCellColumn()
        {
            throw new NotImplementedException();
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
            LabelEmpName.Text = "";
            LabelEmpId.Text = "";
            LabelEmpDept.Text = "";
            // ACTUAL DATA NEEDS TO BE PULLED FROM DATABASE
            LabelEmpName.Text = getName().ToString();
            LabelEmpId.Text = getID().ToString();
            EmployeeID = getID();
            LabelEmpDept.Text = getDepartment().ToString();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            LoadData(); //--------------------------------------------------------

           
        }
        /*
        private void LoadData()
        {
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "usp_PayData";

            SqlParameter empid = new SqlParameter("@EmpID", SqlDbType.Int);
            SqlParameter stdate = new SqlParameter("@StartDate", SqlDbType.DateTime);
            SqlParameter endate = new SqlParameter("@EndDate", SqlDbType.DateTime);

            command.Parameters.Add(empid);
            command.Parameters.Add(stdate);
            command.Parameters.Add(endate);

            command.Parameters["@EmpID"].Value = EmployeeID;
            command.Parameters["@StartDate"].Value = CalendarStart.SelectedDate;
            command.Parameters["@EndDate"].Value =  CalendarEnd.SelectedDate;

            command.Connection.Open();

            SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

            ChartHours.DataSource = reader;

            ChartHours.Series[0].XValueMember = "Worked On";
            ChartHours.Series[0].YValueMembers = "Total Hours";

            ChartHours.DataBind();
        }

        */
 
        private void LoadData()
        {
            ChartHours.DataSource = GetData();
            ChartHours.Series["Series1"].XValueMember = "Worked On";
            ChartHours.Series["Series1"].YValueMembers = "Total Hours";
        }
        private DataTable GetData()
        {
            DataTable dtDataChart = new DataTable();
            using (SqlConnection conn = new SqlConnection(GlobalInitialization.ConnectionString))
            {
                using (SqlCommand command = new SqlCommand("usp_PayData", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    command.Parameters.AddWithValue("@EmpID", EmployeeID);
                    command.Parameters.AddWithValue("@StartDate", CalendarStart.SelectedDate);
                    command.Parameters.AddWithValue("@EndDate", CalendarEnd.SelectedDate);
                    SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                    dtDataChart.Load(reader);

                }
            }
            return dtDataChart;
        }

        protected void ButtonAddEmployee_Click(object sender, EventArgs e)
        {
            Server.Transfer("EmployeeManagement.aspx", true);
        }

        /*

          //private void makeprocedure()
          //{
          //    string query = @" EXEC usp_PayHour @EmpId, @StartDate, @EndDate ";


          //    using (SqlCommand command = new SqlCommand(query, con))
          //    {
          //        command.CommandType = CommandType.Text;
          //        command.Parameters.AddWithValue("@EmpId", getID());
          //        command.Parameters.AddWithValue("@StartDate", CalendarStart.SelectedDate);
          //        command.Parameters.AddWithValue("@EndDate", CalendarEnd.SelectedDate);
          //        con.Open();
          //        var reader = command.ExecuteReader();
          //        //do something with data in the reader.
          //        con.Close();
          //    }
          //}

          private void LoadData()
          {
              ChartHours.DataSource = GetData();
              ChartHours.Series["Series1"].XValueMember = "Worked On";
              ChartHours.Series["Series1"].YValueMembers = "Total Hours";
          }

          private DataTable GetData()
          {
              string sqlPayHour = @" EXEC usp_PayHour @EmpId, @StartDate, @EndDate ";
              DataTable dtChartData = new DataTable();
              using (SqlCommand command = new SqlCommand(sqlPayHour, con))
              {
                  //command.CommandType = CommandType.StoredProcedure;
                  command.Parameters.Add("@EmpId", SqlDbType.Int).Value = GetData();
                  command.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = CalendarStart.SelectedDate;
                  command.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = CalendarEnd.SelectedDate;
                  //command.Parameters.AddWithValue("@EmpId", getID());
                  //command.Parameters.AddWithValue("@StartDate", CalendarStart.SelectedDate);
                  //command.Parameters.AddWithValue("@EndDate", CalendarEnd.SelectedDate);

                  con.Open();
                  command.ExecuteNonQuery();
                  SqlDataReader reader = command.ExecuteReader();
                  dtChartData.Load(reader);
                  con.Close();
              }

              return dtChartData;
          }


      }
      */
    }
}