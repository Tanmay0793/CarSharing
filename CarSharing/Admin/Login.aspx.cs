using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace CarSharing.Admin
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }


        [WebMethod(EnableSession=true)]
        public static string setValue(string user, string pass)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            
            SqlDataAdapter sda = new SqlDataAdapter("select * from Users where email='"+user+"' and password='"+pass+"'",con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                HttpContext.Current.Session["name"] = dt.Rows[0]["name"].ToString();
                HttpContext.Current.Session["id"] = dt.Rows[0]["id"].ToString();
                return dt.Rows[0]["id"].ToString();
            }
            
            return "fail";
        }
    }
}