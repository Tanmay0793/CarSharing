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
namespace CarSharing.Admin
{
    public partial class AddCity : System.Web.UI.Page
    {
        static string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                bindstate();
            }
        }

        public void bindstate()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from country", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            drpcountry.DataSource = ds;
            drpcountry.DataTextField = "country_name";
            drpcountry.DataValueField = "country_id";
            drpcountry.DataBind();
            drpcountry.Items.Insert(0, new ListItem("--Select--", "0"));

        }


        protected void drpcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int country_id = Convert.ToInt32(drpcountry.SelectedValue);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from state where country_id=" + country_id + "", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            drpstate.DataSource = ds;
            drpstate.DataTextField = "state_name";
            drpstate.DataValueField = "state_id";
            drpstate.DataBind();
            drpstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            id = drpstate.SelectedValue;
        }

        [WebMethod]
        public static string setValue(string name, string status)
        {
            int dr;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_admin_CityAdd";
            SqlParameter para1 = new SqlParameter("@name", name);
            SqlParameter para2 = new SqlParameter("@status", status);
            SqlParameter para3 = new SqlParameter("@state_id", id);
            cmd.Parameters.Add(para1);
            cmd.Parameters.Add(para2);
            cmd.Parameters.Add(para3);
            //cmd.CommandText = "insert into city(city_name,city_status,state_id) values('" + name + "','" + status + "'," + id + ")";
            dr = cmd.ExecuteNonQuery();
            if (dr > 0)
            {
                return "success";
            }
            return "fail";
        }
    }
}