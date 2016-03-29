using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
namespace CarSharing.Client
{
    public partial class CreateRide : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        
        string dhour, dmin, dtime;
        string rhour, rmin, rtime;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["name"] == null && Session["id"] == null)
                {
                    Response.Redirect("Login.aspx?location=CreateRide.aspx");
                }
                bindgrid();
            }   
        }

        public void bindgrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select car_id,car_brand + ' ' + car_name as car from carDetails where user_id="+Session["id"]+"", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ddlvehicle.DataSource = ds;
            ddlvehicle.DataTextField = "car";
            ddlvehicle.DataValueField = "car_id";
            ddlvehicle.DataBind();
            ddlvehicle.Items.Insert(0, new ListItem("--Select Car --", "0"));
        }

        protected void ddlvehicle_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblvehicle.Text = ddlvehicle.SelectedItem.ToString();
            
        }
        
        protected void ddldhour_SelectedIndexChanged(object sender, EventArgs e)
        {
            dhour = ddldhour.SelectedValue;
        }

        protected void ddlmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            dmin = ddldmin.SelectedValue;
        }

        protected void ddlrhour_SelectedIndexChanged(object sender, EventArgs e)
        {
            rhour = ddlrhour.SelectedValue;
        }

        protected void ddlrmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            rmin = ddlrmin.SelectedValue;
        }

        protected void ddlrtime_SelectedIndexChanged(object sender, EventArgs e)
        {
            rtime = ddlrtime.SelectedValue;
        }

        protected void ddldtime_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtime = ddldtime.SelectedValue;
        }

        
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string rdate = null; string rettime = null;
            string deptime = dhour + " : " + dmin + " " + dtime;
            string ddate = Request.Form[txtdepdate.UniqueID];
            if(rbtntype.SelectedValue=="Return")
            { 
               rdate = Request.Form[txtretdate.UniqueID];
               rettime = rhour + " : " + rmin + " " + rtime;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_CreateRide";
            cmd.Parameters.AddWithValue("@user_id", Session["id"]);
            cmd.Parameters.AddWithValue("@car_id", ddlvehicle.SelectedValue);
            cmd.Parameters.AddWithValue("@from", txtfrom.Text);
            cmd.Parameters.AddWithValue("@to", txtto.Text);
            cmd.Parameters.AddWithValue("@distance", "25.2");
            cmd.Parameters.AddWithValue("@trip_type", rbtntype.SelectedValue);
            cmd.Parameters.AddWithValue("@depaDate", ddate);
            cmd.Parameters.AddWithValue("@depaTime", deptime);
            cmd.Parameters.AddWithValue("@returnDate",rdate);
            cmd.Parameters.AddWithValue("@returnTime",rettime);
            cmd.Parameters.AddWithValue("@seats", txtseats.Text);
            cmd.Parameters.AddWithValue("@amt", txtamt.Text);
            cmd.Parameters.AddWithValue("@phone", txtphone.Text);
            cmd.Parameters.AddWithValue("@comments", txtcomment.Text);
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script> alert('OK') </script>");
            }
            
        }
    
    }
}