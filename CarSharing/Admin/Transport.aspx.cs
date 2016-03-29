using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace CarSharing.Admin
{
    public partial class Transport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showData();
                
            }
        }

        protected void showData()
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter("sp_transdatagrid", con);
            sda.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            con.Close();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTransport.aspx");  
        }

        protected void grid1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grid1.EditIndex = e.NewEditIndex;
            showData();
        }

        protected void grid1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grid1.EditIndex = -1;
            showData();
        }

        protected void grid1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox name = grid1.Rows[e.RowIndex].FindControl("txtname") as TextBox;
            TextBox add = grid1.Rows[e.RowIndex].FindControl("txtadd") as TextBox;
            TextBox phone = grid1.Rows[e.RowIndex].FindControl("txtphone") as TextBox;
            TextBox pname = grid1.Rows[e.RowIndex].FindControl("txtper") as TextBox;
            TextBox pno = grid1.Rows[e.RowIndex].FindControl("txtpno") as TextBox;
            Label id = grid1.Rows[e.RowIndex].FindControl("lbltransid") as Label;

            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_transupdate";
            SqlParameter para1 = new SqlParameter("@name", name.Text);
            SqlParameter para2 = new SqlParameter("@address", add.Text);
            SqlParameter para3 = new SqlParameter("@phone", phone.Text);
            SqlParameter para4 = new SqlParameter("@pname", pname.Text);
            SqlParameter para5 = new SqlParameter("@pphone", pno.Text);
            SqlParameter para6 = new SqlParameter("@id", id.Text);
            cmd.Parameters.Add(para1);
            cmd.Parameters.Add(para2);
            cmd.Parameters.Add(para3);
            cmd.Parameters.Add(para4);
            cmd.Parameters.Add(para5);
            cmd.Parameters.Add(para6);
            cmd.ExecuteNonQuery();
            con.Close();
            grid1.EditIndex = -1;
            showData();
        }


    }
}