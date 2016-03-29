using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
namespace CarSharing
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string[] setValue(string user, string pass)
        {
            string[] arr = {"No Data","",""};
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());   
            SqlDataAdapter sda = new SqlDataAdapter("select * from Users where email='" + user + "' and password='" + pass + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                HttpContext.Current.Session["name"] = dt.Rows[0]["name"].ToString();
                HttpContext.Current.Session["id"] = dt.Rows[0]["id"].ToString();
                arr[0]=dt.Rows[0]["id"].ToString();
                arr[1]=dt.Rows[0]["address"].ToString();
                arr[2] = dt.Rows[0]["country_id"].ToString();
                return arr;
            }

            return arr;
        }
    }
}