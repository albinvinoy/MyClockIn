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
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarStartDate.SelectedDate = DateTime.Now;
            CalendarEndDate.SelectedDate = DateTime.Now;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //  Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
        }

        protected void CalendarStartDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxStartDate.Text = CalendarStartDate.SelectedDate.ToShortDateString();
        }

        protected void CalendarEndDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxEndDate.Text = CalendarEndDate.SelectedDate.ToShortDateString();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            //TextBoxLog.Text = "Showing work history from " + TextBoxStartDate.Text + " to " + TextBoxEndDate.Text;
            bool DataValidator = CheckValidDate(CalendarStartDate.SelectedDate, CalendarEndDate.SelectedDate);
            if (DataValidator == true)
            {
                string date = DateRetrieve();
                TextBoxLog.Text = date;
            }
            else
            {
                TextBoxLog.Text = "Invalid Date";
            }


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

        private string DateRetrieve()
        {
            DateTime re = DateTime.Now;
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
        }

    }
}