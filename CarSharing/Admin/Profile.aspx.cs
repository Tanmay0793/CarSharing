using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace CarSharing.Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_showUserDetails";
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["id"]));
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblID.Text = dt.Rows[0]["id"].ToString();
                    lblName.Text = dt.Rows[0]["name"].ToString();
                    lblusername.Text = dt.Rows[0]["Uname"].ToString();
                    lblType.Text = dt.Rows[0]["usertype"].ToString();
                    lblAddress.Text = dt.Rows[0]["address"].ToString();
                    lblCity.Text = dt.Rows[0]["city"].ToString();
                    lblState.Text = dt.Rows[0]["state"].ToString();
                    lblCountry.Text = dt.Rows[0]["country"].ToString();
                    lblPhone.Text = dt.Rows[0]["phone"].ToString();
                    lblEmail.Text = dt.Rows[0]["email"].ToString();
                    image1.ImageUrl = dt.Rows[0]["filePath"].ToString();
                }
            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
        }
    }
}