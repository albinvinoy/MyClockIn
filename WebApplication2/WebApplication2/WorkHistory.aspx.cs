using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarStartDate.SelectedDate = DateTime.Now;
            CalendarEndDate.SelectedDate = DateTime.Now;
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
            TextBoxLog.Text = "Showing work history from " + TextBoxStartDate.Text + " to " + TextBoxEndDate.Text;
 
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
    }
}