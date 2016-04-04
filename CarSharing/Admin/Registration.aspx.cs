using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace CarSharing
{
    public partial class Registration : System.Web.UI.Page
    {
        static int countryid=0;
        static int sid=0;
        static int cityid=0;
        static int aid=0;
        static string fileName=null;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["userid"] != null)
                {
                    btnSave.Text = "Update";
                    txtusername.Enabled = false;
                    
                    binddata();  
                }
                else
                {
                    btnSave.Text = "Save";
                }
                binddropdown();
            }
        }

        public void binddata()
        {

            

         /*   cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_showUserDetails";
            cmd.Parameters.AddWithValue("@id", Request["userid"]);
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                txtusername.Text = dt.Rows[0]["user_uname"].ToString();
                drptype.SelectedValue = dt.Rows[0]["usertype"].ToString();
                imgProfile.ImageUrl = dt.Rows[0]["FilePath"].ToString();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtaddress.Text = dt.Rows[0]["address"].ToString();

                
                txtxphone.Text = dt.Rows[0]["phone"].ToString();
                txtemail.Text = dt.Rows[0]["email"].ToString();
                string sex = dt.Rows[0]["sex"].ToString();
                if (sex == "Male")
                {
                    rbtnsex.SelectedValue = "Male";
                }
                else
                {
                    rbtnsex.SelectedValue = "Female";
                }
                string status = dt.Rows[0]["status"].ToString();
                if (status == "true")
                {
                    checkActive.Checked = true;
                }
                else
                {
                    checkActive.Checked = false;
                }
                //txtcar.Text = dt.Rows[0]["country"].ToString();
                //drpState.Text = dt.Rows[0]["state_name"].ToString();
                //drpCity.Text = dt.Rows[0]["city_name"].ToString();
                //drpArea.SelectedValue = dt.Rows[0]["area_name"].ToString();

                string country = dt.Rows[0]["country"].ToString();*/
        //    }
        }


        
        public void binddropdown()
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
            lblok.Visible = false;
            SqlDataAdapter sda = new SqlDataAdapter("select user_uname from Users where user_uname='"+txtusername.Text+"'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                txtaddress.Enabled = true; txtxphone.Enabled = true; txtemail.Enabled = true; txtpass.Enabled = true; txtrepass.Enabled = true; txtcar.Enabled = true;
                lblok.Text = "Available";
                lblok.Visible = true;
            }
            else
            {
                lblok.Text = "Not Available";
                lblok.Visible = true;
            }
            
        }

        protected void drpcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            countryid = Convert.ToInt32(drpcountry.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter("select * from state where country_id=" + countryid + "", con);
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
            sid = Convert.ToInt32(drpState.SelectedValue);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from city where state_id=" + sid + "", con);
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
            cityid = Convert.ToInt32(drpCity.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter("select * from area where city_id=" + cityid + "", con);
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
            aid = Convert.ToInt32(drpArea.SelectedValue);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
                if (btnSave.Text == "Save")
                {
                    
                    string str=fileName;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_registration";
                    cmd.Parameters.AddWithValue("@id", "0");
                    cmd.Parameters.AddWithValue("@name", txtname.Text);
                    cmd.Parameters.AddWithValue("@uname", txtusername.Text);
                    cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                    cmd.Parameters.AddWithValue("@country_id",countryid);
                    cmd.Parameters.AddWithValue("@state_id", sid);
                    cmd.Parameters.AddWithValue("@city_id", cityid);
                    cmd.Parameters.AddWithValue("@area_id", aid);
                    cmd.Parameters.AddWithValue("@phone", txtxphone.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@sex", rbtnsex.SelectedValue);
                    cmd.Parameters.AddWithValue("@usertype", drptype.SelectedValue);
                    cmd.Parameters.AddWithValue("@password", txtpass.Text);
                    cmd.Parameters.AddWithValue("@status", checkActive.Value);
                    cmd.Parameters.AddWithValue("@Filename", fileName);
                    cmd.Parameters.AddWithValue("@FilePath", "/images/" + fileName);
                    con.Open();
                    cmd.Connection = con;
                    int dr = cmd.ExecuteNonQuery();
                    if (dr > 0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    con.Close();
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
       
    }
}