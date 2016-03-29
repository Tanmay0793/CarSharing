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
    public partial class carDetails : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("sp_cardatagrid", con);
            sda.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            con.Close();
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
            Label id = grid1.Rows[e.RowIndex].FindControl("lblcid") as Label;
            TextBox cname = grid1.Rows[e.RowIndex].FindControl("txtcname") as TextBox;
            TextBox cbrand = grid1.Rows[e.RowIndex].FindControl("txtcbrand") as TextBox;
            DropDownList ctype = grid1.Rows[e.RowIndex].FindControl("cType") as DropDownList;
            TextBox regno = grid1.Rows[e.RowIndex].FindControl("txtregno") as TextBox;
            DropDownList seat = grid1.Rows[e.RowIndex].FindControl("cSeats") as DropDownList;
            DropDownList status = grid1.Rows[e.RowIndex].FindControl("cstatus") as DropDownList;

            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_cardataupdate";
            SqlParameter para2 = new SqlParameter("@name", cname.Text);
            SqlParameter para3 = new SqlParameter("@brand", cbrand.Text);
            SqlParameter para4 = new SqlParameter("@type", ctype.SelectedValue);
            SqlParameter para5 = new SqlParameter("@regNo", regno.Text);
            SqlParameter para6 = new SqlParameter("@seat", seat.SelectedValue);
            SqlParameter para7 = new SqlParameter("@status", status.SelectedValue);
            SqlParameter para1 = new SqlParameter("@id", id.Text);
            cmd.Parameters.Add(para2);
            cmd.Parameters.Add(para3);
            cmd.Parameters.Add(para4);
            cmd.Parameters.Add(para5);
            cmd.Parameters.Add(para6);
            cmd.Parameters.Add(para7);
            cmd.Parameters.Add(para1);
            cmd.ExecuteNonQuery();
            grid1.EditIndex = -1;
            con.Close();
            showData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCar.aspx");
        }

        protected void grid1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ctype = e.Row.FindControl("cType") as DropDownList;
                    DropDownList seat = e.Row.FindControl("cSeats") as DropDownList;
                    DropDownList status = e.Row.FindControl("cstatus") as DropDownList;
                    cmd.Connection = con;
                    SqlDataAdapter sda = new SqlDataAdapter("sp_cardatagrid", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ctype.SelectedValue = ((DataRowView)e.Row.DataItem)["car_type"].ToString();
                    seat.SelectedValue = ((DataRowView)e.Row.DataItem)["car_seat"].ToString();
                    status.SelectedValue = ((DataRowView)e.Row.DataItem)["car_status"].ToString();
                }
            }
        }
    }
}