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
Data Source=**********;Initial Catalog=********;User ID=*******;Password=*******
";
        public static int ID;
        public static int LoginStatus;
    }
}