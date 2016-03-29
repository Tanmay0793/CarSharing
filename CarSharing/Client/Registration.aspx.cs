using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace CarSharing
{
    public partial class Registration1 : System.Web.UI.Page
    {
        static int country = 0;
        static int state = 0;
        static int city = 0;
        static int area = 0;
        static string fileName = null;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (!IsPostBack)
            {
                lblstatus.Text = "";

                if (Request["userid"] != null)
                {
                    SqlDataAdapter sda = new SqlDataAdapter("select name,phone,email,usertype from Users where id='" + Request["userid"] + "'",con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        txtname.Text = dt.Rows[0]["name"].ToString();
                        txtxphone.Text = dt.Rows[0]["phone"].ToString();
                        txtemail.Text = dt.Rows[0]["email"].ToString();
                        drptype.SelectedValue = dt.Rows[0]["usertype"].ToString();
                    }
                }

                bindCountry();
            }
            lblstatus.Visible = false;
        }

        public void bindCountry()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from country", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            drpcountry.DataSource = ds;
            drpcountry.DataTextField = "country_name";
            drpcountry.DataValueField = "country_id";
            drpcountry.DataBind();
            drpcountry.Items.Insert(0, new ListItem("--Select Country--", "0"));
        }


        protected void btnsearch_Click(object sender, EventArgs e)
        {
            lblstatus.Visible = false;
            SqlDataAdapter sda = new SqlDataAdapter("select user_uname from Users where user_uname='" + txtuname.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                txtaddress.Enabled = true; txtxphone.Enabled = true; txtemail.Enabled = true; txtpass.Enabled = true; txtrepass.Enabled = true; txtcar.Enabled = true;
                lblstatus.Text = "Available";
                lblstatus.ForeColor = System.Drawing.Color.Green;
                lblstatus.Visible = true;
                
            }
            else
            {
                lblstatus.Text = "Not Available";
                lblstatus.Visible = true;
                lblstatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (fileUpload.PostedFile != null)
            {
                fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                fileUpload.SaveAs(Server.MapPath("/images/" + fileName));
                imgProfile.ImageUrl = "../images/" + fileName;
            }
        }

        protected void drpcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            country = Convert.ToInt32(drpcountry.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter("select * from state where country_id=" + country + "", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            drpState.DataSource = ds;
            drpState.DataTextField = "state_name";
            drpState.DataValueField = "state_id";
            drpState.DataBind();
            drpState.Items.Insert(0, new ListItem("--Select State--", "0"));
        }

        protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
        {
            state = Convert.ToInt32(drpState.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter("select * from city where state_id=" + state + "", con);
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
            city = Convert.ToInt32(drpCity.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter("select * from area where city_id=" + city + "", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            con.Close();
            drpArea.DataSource = ds;
            drpArea.DataTextField = "area_name";
            drpArea.DataValueField = "area_id";
            drpArea.DataBind();
            drpArea.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void drpArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            area = Convert.ToInt32(drpArea.SelectedValue);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "sp_registration";
            //cmd.Parameters.AddWithValue("@id", "0");
            //cmd.Parameters.AddWithValue("@name", txtname.Text);
            //cmd.Parameters.AddWithValue("@uname", txtuname.Text);
            //cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            //cmd.Parameters.AddWithValue("@country_id", country);
            //cmd.Parameters.AddWithValue("@state_id", state);
            //cmd.Parameters.AddWithValue("@city_id", city);
            //cmd.Parameters.AddWithValue("@area_id", area);
            //cmd.Parameters.AddWithValue("@phone", txtxphone.Text);
            //cmd.Parameters.AddWithValue("@email", txtemail.Text);
            //cmd.Parameters.AddWithValue("@sex", rbtnsex.SelectedValue);
            //cmd.Parameters.AddWithValue("@usertype", drptype.SelectedValue);
            ////cmd.Parameters.AddWithValue("@password", txtpass.Text);
            //cmd.Parameters.AddWithValue("@status", checkActive.Value);
            //cmd.Parameters.AddWithValue("@Filename", fileName);
            //cmd.Parameters.AddWithValue("@FilePath", "/images/" + fileName);
            //con.Open();
            //cmd.Connection = con;
            //int dr = cmd.ExecuteNonQuery();
            //if (dr > 0)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //con.Close();
            if (hidden.Value == "hello")
            {
                Response.Redirect("Login.aspx");
            }
        }




    }
}