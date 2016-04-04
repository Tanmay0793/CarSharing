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
    public partial class AddCountry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (!IsPostBack)
            //    {
            //        if (Session["name"]!=null)
            //        {
            //            lblsession.Text = Convert.ToString(Session["name"]);
            //        }
            //        else
            //        {
            //            Response.Redirect("Login.aspx");
            //        }
            //    }
            //}
        }

        [WebMethod]
        public static string setValue(string name, string status)
        {
            int dr;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "insert into country(country_name,country_status) values('" + name + "','" + status + "')";
            dr = cmd.ExecuteNonQuery();
            if (dr > 0)
            {
                return "success";
            }
            return "fail";
        }
    }
}