using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
namespace CarSharing.Admin
{
    public partial class AddTransport : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                this.Dispose();
            }
        }

        [WebMethod]
        public static string setValue(string name, string add, string phone, string pname, string pphone)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_transadd";
            SqlParameter para1 = new SqlParameter("@name", name);
            SqlParameter para2 = new SqlParameter("@address", add);
            SqlParameter para3 = new SqlParameter("@phone", phone);
            SqlParameter para4 = new SqlParameter("@person", pname);
            SqlParameter para5 = new SqlParameter("@personno", pphone);
            cmd.Parameters.Add(para1);
            cmd.Parameters.Add(para2);
            cmd.Parameters.Add(para3);
            cmd.Parameters.Add(para4);
            cmd.Parameters.Add(para5);
            int dr = cmd.ExecuteNonQuery();
            if (dr > 0)
            {
                return "success";
            }

            return "fail";
        }

    }
}