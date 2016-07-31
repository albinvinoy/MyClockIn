using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication2.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public class GlobalInitialization : Page
    {
        public static string ConnectionString = @"
Data Source=brandonknapp.net;Initial Catalog=bnap88_property;Persist Security Info=True;User ID=application;Password=Snow$Board$2000
";
        public static int ID;
        public static int LoginStatus;
    }
}