using System;
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
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["name"] != null && Session["id"]!=null)
                {

                    lblprofile.Text = Session["name"].ToString();
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
                    SqlCommand cmd = new SqlCommand();
                    string query = "select FilePath from Users where name='" + Session["name"] + "'";
                    SqlDataAdapter sda = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        image1.ImageUrl = dt.Rows[0]["FilePath"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

               
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}