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
        string my_notes;
        private int smartCount = 0;
        //   private string connectionstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Users\Albin\dummy.mdf;Integrated Security=True;";
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Users\Albin\dummy.mdf;Integrated Security=True;");
        int EmployeeId = 100;

        public void Page_Load(object sender, EventArgs e)
        {


            buttonupdate();

            

            
        }

        protected void In_Click(object sender, EventArgs e)
        {
                DateTime start = new DateTime();
                start = DateTime.Now;

                string format = start.ToShortTimeString();
                Label1.Text = "Clock In Time" + format;
                smartCount++;

                string sqlin = @"INSERT INTO [Time] ([Time in], [Work / Abscent], [EmployeeIdFK])
VALUES('" + start + "',1,'" + EmployeeId + "');";

                addTime(sqlin);
                buttonupdate();
            }

        protected void Out_Click(object sender, EventArgs e)
        {
            
                DateTime end = new DateTime();
                end = DateTime.Now;

                string format = end.ToShortTimeString();
                Label2.Text = "Clock Out Time: " + format;
                smartCount++;
                string sqlin = @"update [Time]
            set [Time out] = '" + end + "' where [EmployeeIdFK] = '" + EmployeeId + "'and [Time out] is null;";


                addTime(sqlin);
                buttonupdate();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox1.Text = smartCount.ToString();
        }

        private void displayTime()
        {
            Label3.Text = "Cuurrent Time: " + DateTime.Now.ToShortTimeString();
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
               smartCount = (Int32) command.ExecuteScalar();
                
            }
            catch(SqlException ex)
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
            TextBox1.Text = smartCount.ToString();
        }

    }
}