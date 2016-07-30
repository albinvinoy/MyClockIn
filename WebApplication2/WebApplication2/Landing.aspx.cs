using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Landing : System.Web.UI.Page
    {
        DateTime TimeStart = new DateTime();
        DateTime end = new DateTime();

        string my_notes;
        private int smartCount = 0;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Users\Albin\dummy.mdf;Integrated Security=True;");
        int EmployeeId = 100;

        public void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
           // Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
            buttonupdate();
        }

        protected void In_Click(object sender, EventArgs e)
        {
            DateTime start = new DateTime();
            start = DateTime.Now;

            string format = start.ToShortTimeString();
            LabelClockIn.Text = "Clock In Time" + format;
            smartCount++;

            string sqlin = @"INSERT INTO [Time] ([Time in], [Work / Abscent], [EmployeeIdFK])
VALUES('" + start + "',1,'" + EmployeeId + "');";

            addTime(sqlin);
            buttonupdate();
        }

        protected void Out_Click(object sender, EventArgs e)
        {
            double time = 0;
            //DateTime total = new DateTime();
            //DateTime end = new DateTime();
            
            end = DateTime.Now;
            
            string format = end.ToShortTimeString();
            LabelClockOut.Text = "Clock Out Time: " + format;
            smartCount++;

            // get the start time of the work period
            TimeStart = getStartTime();

            //calculate the total time
             var TotalWorkTime = (end - TimeStart).TotalHours;
            TotalWorkTime = Math.Round(TotalWorkTime, 2);

            LabelTotalTime.Text = TimeStart.ToShortTimeString() + " " + end.ToShortTimeString() + " " + " Hours worked " + TotalWorkTime.ToString(); 
            // query to update time out and total time
            string sqlin = @"update [Time]
            set [Time out] = '" + end + "', [Total Hours] = '" + TotalWorkTime +"' where [EmployeeIdFK] = '" + EmployeeId + "'and [Time out] is null;";

            addTime(sqlin);
            buttonupdate();

            
        }

        protected void TextBoxNotes_TextChanged(object sender, EventArgs e)
        {
            my_notes = TextBoxNotes.Text;
        }

        private void displayTime()
        {
            LabelCurrentTime.Text = "Current Time: " + DateTime.Now.ToShortTimeString();
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
                Out.Enabled = false;
                In.Enabled = true;
            }
            //else disable clock in
            else
            {
                Out.Enabled = true;
                In.Enabled = false;
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

        // Back Button Fix (Attempt only, not currently working)
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1500;
            Response.CacheControl = "no-cache";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }
    }
}