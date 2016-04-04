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
    public partial class ShowUsers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Binddata();
            }
        }
        public void Binddata()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select id,name,user_uname,email,status from Users where usertype='User'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            
        }

        protected void grid1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grid1.EditIndex = e.NewEditIndex;
            Binddata();
        }

        protected void grid1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grid1.EditIndex = -1;
            Binddata();
        }

        protected void grid1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DropDownList dstatus = grid1.Rows[e.RowIndex].FindControl("ddlstatus") as DropDownList;
            Label id=grid1.Rows[e.RowIndex].FindControl("lblid") as Label;

            SqlDataAdapter sda = new SqlDataAdapter("update Users set status='"+dstatus.SelectedValue+"' where id="+id+"", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            grid1.EditIndex = -1;
            Binddata();
        }

        protected void grid1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList dstatus = e.Row.FindControl("ddlstatus") as DropDownList;
                    SqlDataAdapter sda = new SqlDataAdapter("select id,name,user_uname,email,status from Users where usertype='User'",con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    dstatus.SelectedValue = ((DataRowView)e.Row.DataItem)["status"].ToString();
                }
            }
        }

       
    }
}