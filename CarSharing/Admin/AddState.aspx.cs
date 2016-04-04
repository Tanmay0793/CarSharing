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
    public partial class AddState : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        SqlCommand cmd = new SqlCommand();
        static string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropList();

            }
        }
        public void dropList()
        {
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
            id = drpcountry.SelectedValue;
        }

        [WebMethod]
        public static string setValue(string name, string status)
        {
            int dr;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "insert into state(state_name,state_status,country_id) values('" + name + "','" + status + "'," + id + ")";
            dr = cmd.ExecuteNonQuery();
            if (dr > 0)
            {
                return "success";
            }
            return "fail";
        }
    }
}