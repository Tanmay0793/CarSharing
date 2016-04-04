using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace CarSharing.Admin
{
    public partial class AdminList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                binddata();
            }
        }

        public void binddata()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Users where usertype='Admin'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            con.Close();
        }

        protected void grid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = grid1.SelectedValue.ToString();
            Response.Redirect("Registration.aspx?userid=" + str);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}