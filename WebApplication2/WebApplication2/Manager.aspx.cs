using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Manager : System.Web.UI.Page
    {
        DateTime TimeStart = new DateTime();
        DateTime end = new DateTime();
        int smartCount;

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Users\Albin\dummy.mdf;Integrated Security=True;");
        int EmployeeId = 100;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonClockIn_Click(object sender, EventArgs e)
        {
            DateTime start = new DateTime();
            start = DateTime.Now;

            string format = start.ToShortTimeString();
            LabelCurrentTime.Text = "Clock In Time" + format;

            string sqlin = @"INSERT INTO [Time] ([Time in], [Work / Abscent], [EmployeeIdFK])
VALUES('" + start + "',1,'" + EmployeeId + "');";

            addTime(sqlin);
            buttonupdate2();
        }

        protected void ButtonClockOut_Click(object sender, EventArgs e)
        {
            end = DateTime.Now;

            string format = end.ToShortTimeString();
            LabelClockIn.Text = "Clock Out Time: " + format;

            // get the start time of the work period
            TimeStart = getStartTime();

            //calculate the total time
            var TotalWorkTime = (end - TimeStart).TotalHours;

            LabelClockOut.Text = TimeStart.ToString() + " " + end.ToString() + " " + TotalWorkTime.ToString();
            // query to update time out and total time
            string sqlin = @"update [Time]
            set [Time out] = '" + end + "', [Total Hours] = '" + TotalWorkTime + "' where [EmployeeIdFK] = '" + EmployeeId + "'and [Time out] is null;";

            addTime(sqlin);
            buttonupdate2();
        }

        private void addTime(string cmd)
        {
            SqlCommand command = new SqlCommand(cmd, con);
            try
            {
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
            }
            catch (SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
        private void buttonupdate()
        {
            string buttonsql =
                @"
    select count(*)
    from [Time]
    where [Time out] is null";
            int btnctrl = TestButtonIn(buttonsql);
            //if count = 0 disables clock out button
            if (btnctrl == 0)
            {
                ButtonClockIn.Enabled = false;
                ButtonClockOut.Enabled = true;
            }
            //else disable clock in
            else
            {
                ButtonClockOut.Enabled = true;
                ButtonClockIn.Enabled = false;
            }
            // TextBox1.Text = smartCount.ToString();
        }

        private DateTime getStartTime()
        {
            DateTime startm = new DateTime();
            string getstarttime = @"
select [Time in]
from [Time]
where [EmployeeIdFK] = '" + EmployeeId + "'and [Time out] is null;";
            SqlCommand command = new SqlCommand(getstarttime, con);

            try
            {
                con.Open();
                startm = (DateTime)command.ExecuteScalar();
            }
            catch (SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }
            return startm;
        }

        private int TestButtonIn(string cmd)
        {
            SqlCommand command = new SqlCommand(cmd, con);
            try
            {
                con.Open();
                smartCount = (Int32)command.ExecuteScalar();

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }
            return smartCount;
        }

        private void buttonupdate2()
        {
            string buttonsql =
                @"
    select count(*)
    from [Time]
    where [Time out] is null";
            int btnctrl = TestButtonIn(buttonsql);
            //if count = 0 disables clock out button
            if (btnctrl == 0)
            {
                ButtonClockOut.Enabled = false;
                ButtonClockIn.Enabled = true;
            }
            //else disable clock in
            else
            {
                ButtonClockOut.Enabled = true;
                ButtonClockIn.Enabled = false;
            }
            // TextBox1.Text = smartCount.ToString();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

        }
    }

}