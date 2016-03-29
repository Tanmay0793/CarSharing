using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace CarSharing.Admin
{
    public partial class AddCar : System.Web.UI.Page
    {
        static string brand;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }
        }

        public void bindgrid()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from carBrand", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            drpbrand.DataSource = ds;
            drpbrand.DataTextField = "brand_name";
            drpbrand.DataValueField = "brand_name";
            drpbrand.DataBind();
            drpbrand.Items.Insert(0, new ListItem("--Select Brand--", "0"));
        }

        protected void drpbrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            brand = drpbrand.SelectedValue;
        }

        [WebMethod]
        public static string setValue(string name, string type, string cno, string regno, string seats, string status)
        {
            int dr;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_caradd";
            SqlParameter para1 = new SqlParameter("@name", name);
            SqlParameter para2 = new SqlParameter("@brand", brand);
            SqlParameter para3 = new SqlParameter("@type", type);
            SqlParameter para4 = new SqlParameter("@carno", cno);
            SqlParameter para5 = new SqlParameter("@regno", regno);
            SqlParameter para6 = new SqlParameter("@seat", seats);
            SqlParameter para7 = new SqlParameter("@status", status);
            cmd.Parameters.Add(para1);
            cmd.Parameters.Add(para2);
            cmd.Parameters.Add(para3);
            cmd.Parameters.Add(para4);
            cmd.Parameters.Add(para5);
            cmd.Parameters.Add(para6);
            cmd.Parameters.Add(para7);
            dr = cmd.ExecuteNonQuery();
            if (dr > 0)
            {
                return "success";
            }
            else
            {
                return "fail";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("carDetails.aspx");
        }
    }
}