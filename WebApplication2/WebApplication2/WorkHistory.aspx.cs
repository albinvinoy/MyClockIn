using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

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

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            string toEmail;
            string myAccount = GlobalInitialization.gaccount;
            string myPass = GlobalInitialization.passes;
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            client.Port = 25;

            //Albin we need an sql query to get the email from whoever we want to send it to
            //it has to be a valid email so we need real email addresses in our database

            // setup Smtp authentication
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(myAccount, myPass);
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(myAccount);
            msg.To.Add(new MailAddress(myAccount));

            msg.Subject = "Work History";


            //this is where we will put the work history we need to create a string from the data from the current work history look up
            //change me 
            msg.Body = "test";

   try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
            }
        }
    }
}