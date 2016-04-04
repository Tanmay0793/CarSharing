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
    public partial class AddArea : System.Web.UI.Page
    {
        static string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (!IsPostBack)
                //{
                //    if (Request["userid"] != null)
                //    {

                //        lblsession.Text = Convert.ToString(Session["name"]);
                //    }
                //    else
                //    {
                //        Response.Redirect("Login.aspx");
                //    }
                //}
                bindcountry();
            }
        }

        public void bindcountry()
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
            int state_id = Convert.ToInt32(drpstate.SelectedValue);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from city where state_id=" + state_id + "", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            drpCity.DataSource = ds;
            drpCity.DataTextField = "city_name";
            drpCity.DataValueField = "city_id";
            drpCity.DataBind();
            drpCity.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void drpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            id = drpCity.SelectedValue;
        }

        [WebMethod]
        public static string setValue(string name, string status, string pin)
        {
            int dr;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_admin_AreaAdd";
            SqlParameter para1 = new SqlParameter("@name", name);
            SqlParameter para2 = new SqlParameter("@pin", pin);
            SqlParameter para3 = new SqlParameter("@status", status);
            SqlParameter para4 = new SqlParameter("@city_id", id);
            cmd.Parameters.Add(para1);
            cmd.Parameters.Add(para2);
            cmd.Parameters.Add(para3);
            cmd.Parameters.Add(para4);
            dr = cmd.ExecuteNonQuery();

            /*cmd.CommandText = "insert into area(area_name,area_pincode,area_status,city_id) values('" + name + "','" + pin + "','" + status + "'," + id + ")";
            dr = cmd.ExecuteNonQuery();*/
            if (dr > 0)
            {
                return "success";
            }
            return "fail";
        }
    }
}