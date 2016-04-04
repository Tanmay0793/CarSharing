using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace CarSharing.Client
{
    public partial class RideDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["id"] != null)
                //{
                    if (Request["name"] != null)
                    {
                        showData();   
                    }
                ////}
            }
        }

        void showData()
        {
            lblname.Text = Request["name"];
            lblcname.Text = Request["Car"];
            lblsource.Text = Request["from"];
            lbldest.Text = Request["to"];
            lbldDate.Text = Request["Ddate"];
            lbldTime.Text = Request["Dtime"];
            lblrDate.Text = Request["Rdate"];
            lblrTime.Text = Request["Rtime"];
            lblseats.Text = Request["seat"];
            lblphone.Text = Request["phone"];
            lblamt.Text = Request["amount"];
            lblcomment.Text = Request["comments"];
            image1.ImageUrl = Request["image"];
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {           
            int seats=Convert.ToInt32(Request["seat"]);
            int Request_seat=Convert.ToInt32(txtseats.Text);
            int driver_id =Convert.ToInt32(Request["driver_id"]);
            int cust_id = Convert.ToInt32(Session["id"]);
            int ride_id = Convert.ToInt32(Request["ride_ID"]);
            if (Request_seat <= seats)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_RequestRide";
                cmd.Parameters.AddWithValue("@d_id", driver_id);
                cmd.Parameters.AddWithValue("@c_id", cust_id);
                cmd.Parameters.AddWithValue("@r_id", ride_id);
                cmd.Parameters.AddWithValue("@seats",txtseats.Text);
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script> alert('Form is Requested') </script>");
                    Response.Redirect("index.aspx");
                }
            }
        }
    }
}