using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Contact : Page
    {
        SqlConnection connection = new SqlConnection(GlobalInitialization.ConnectionString);

        //uppon loading set calender date and set employee ID
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpIDTxt.Text = GlobalInitialization.ID.ToString();
           // CalendarStartDate.SelectedDate = DateTime.Now;
           // CalendarEndDate.SelectedDate = DateTime.Now;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //  Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
            
        }

        // set textbox to calender date selected
        protected void CalendarStartDate_SelectionChanged(object sender, EventArgs e)
        {

            TextBoxStartDate.Text = CalendarStartDate.SelectedDate.ToShortDateString();
            SumHoursInLabel();


        }

        // set textbox to calender date selected
        protected void CalendarEndDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxEndDate.Text = CalendarEndDate.SelectedDate.ToShortDateString();
            SumHoursInLabel();

        }
    

        protected void TextBoxStartDate_TextChanged(object sender, EventArgs e)
        {
            // Don't Remove
        }

        protected void TextBoxEndDate_TextChanged(object sender, EventArgs e)
        {
            // Don't Remove
        }

        protected void TextBoxLog_TextChanged(object sender, EventArgs e)
        {
            // Don't Remove
        }

        //check's date entry is valid, start > end
        protected bool CheckValidDate(DateTime start, DateTime end)
        {
            if (start > end)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        //set the lblTotalHours text to the sum of total hours of the selected dates on the callender, if dates are invalid clear the label
        protected void SumHoursInLabel()
        {
            if (CheckValidDate(CalendarStartDate.SelectedDate, CalendarEndDate.SelectedDate))
            {

                string sqlWorkhistory = @"
    select SUM([Total Hours])
    from [Time]
    where [EmployeeIdFK] = '" + GlobalInitialization.ID + "' and [Time in] >= '" + CalendarStartDate.SelectedDate + "' and [Time out] <= '" + CalendarEndDate.SelectedDate.AddHours(23).AddMinutes(59).AddSeconds(59) + "' ;";
                connection.Open();
                SqlCommand command = new SqlCommand(sqlWorkhistory, connection);
                object result = command.ExecuteScalar();
                lblTotalHours.Text = Convert.ToString(result);


            }
            else
                lblTotalHours.Text = " ";
                //do nothing
        }


        //returns the Time in values between two dates
        /*  private string DateRetrieve()
          {
              string sqlWorkhistory = @"
      select [Time in]
      from [Time]
      where [EmployeeIdFK] = '" + GlobalInitialization.ID + "'and [Time in] between '" + CalendarStartDate.SelectedDate + "' and '" + CalendarEndDate.SelectedDate + "';'";
              SqlCommand command = new SqlCommand(sqlWorkhistory, connection);

              try
              {
                  connection.Open();
                  re = (DateTime)command.ExecuteScalar();

              }
              catch (SqlException ex)
              {

              }
              finally
              {
                  connection.Close();
              }
              return re.ToString();

          }*/




        protected void EmpHistory_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GVEmpHist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GVEmpHistory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }


    }
}