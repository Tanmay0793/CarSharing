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
using System.Web.Services;
namespace CarSharing.Admin
{
    public partial class AdminAdd : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        SqlCommand cmd = new SqlCommand();
        static string fileName=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request["userid"] != null)
                //{
                //    btnAdd.Text = "Update";
                //    editdata();
                //}
                //else
                //{
                    btnAdd.Text = "Save";
                //}
            }
        }

        public void editdata()
        {

            //SqlDataAdapter sda = new SqlDataAdapter("select * from admin where admin_id=" + Request["userid"] + "", con);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
                //byte[] bytes = (byte[])dt.Rows[0]["admin_fileContent"];
                //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                //image1.ImageUrl = "data:image/png;base64," + base64String;
                
                //txtname.Text = dt.Rows[0]["admin_name"].ToString();
                //txtemail.Text = dt.Rows[0]["admin_email"].ToString();
            //}
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //if (txtname.Text != "" && txtemail.Text != "" && txtpass.Text != "" && txtpassc.Text != "")
            //{
            //    string filename = Path.GetFileName(fileup.PostedFile.FileName);
            //   // string contentType = fileup.PostedFile.ContentType;
            //    //Stream fs = fileup.PostedFile.InputStream;
            //    //BinaryReader br = new BinaryReader(fs);
            //    //byte[] bytes = br.ReadBytes((Int32)fs.Length);

            //    fileup.SaveAs(Server.MapPath("images/" + filename));

            //    if (btnAdd.Text == "Update")
            //    {
            //     //   cmd.CommandType = CommandType.StoredProcedure;
            //     //   cmd.CommandText = "sp_adminadd";
            //     //   SqlParameter para1 = new SqlParameter("@name", txtname.Text);
            //     //   SqlParameter para2 = new SqlParameter("@email", txtemail.Text);
            //     //   SqlParameter para3 = new SqlParameter("@pass", txtpass.Text);
            //     //   SqlParameter para4 = new SqlParameter("@id", Request["userid"]);
            //     //   SqlParameter para5 = new SqlParameter("@filename", filename);
            //     //// SqlParameter para6 = new SqlParameter("@fileType", contentType);
            //     ////   SqlParameter para7 = new SqlParameter("@fileContent", bytes);
            //     //   cmd.Parameters.Add(para1);
            //     //   cmd.Parameters.Add(para2);
            //     //   cmd.Parameters.Add(para3);
            //     //   cmd.Parameters.Add(para4);
            //     //   cmd.Parameters.Add(para5);
            //     ////   cmd.Parameters.Add(para6);
            //     // //  cmd.Parameters.Add(para7);
            //     //   con.Open();
            //     //   cmd.Connection = con;
            //     //   int dr = cmd.ExecuteNonQuery();
            //     //   if (dr > 0)
            //     //   {
            //     //       Response.Redirect("AdminList.aspx");
            //     //   }

            //    }
            //    else if (btnAdd.Text == "Save")
            //    {

            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.CommandText = "sp_adminadd";
            //        SqlParameter para1 = new SqlParameter("@name", txtname.Text);
            //        SqlParameter para2 = new SqlParameter("@email", txtemail.Text);
            //        SqlParameter para3 = new SqlParameter("@pass", txtpass.Text);
            //        SqlParameter para4 = new SqlParameter("@filename", filename);
            //       // SqlParameter para5 = new SqlParameter("@fileType", contentType);
            //       // SqlParameter para6 = new SqlParameter("@fileContent", bytes);
            //        SqlParameter para7 = new SqlParameter("@id", "0");
            //        cmd.Parameters.Add(para1);
            //        cmd.Parameters.Add(para2);
            //        cmd.Parameters.Add(para3);
            //        cmd.Parameters.Add(para4);
            //       // cmd.Parameters.Add(para5);
            //       // cmd.Parameters.Add(para6);
            //        cmd.Parameters.Add(para7);
            //        con.Open();
            //        cmd.Connection = con;
            //        int dr = cmd.ExecuteNonQuery();
            //        if (dr > 0)
            //        {
            //            Response.Redirect("AdminList.aspx");
            //        }
            //    }

            //}
            //else
            //{
            //    Response.Write("Please Fill data");
            //}



        }

       

        protected void btnAdd1_Click(object sender, EventArgs e)
        {
            if(fileup1.PostedFile!=null)
            { 
                fileName = Path.GetFileName(fileup1.PostedFile.FileName);
                fileup1.SaveAs(Server.MapPath("../images/" + fileName));
                image3.ImageUrl = "../images/" + fileName;
                //con.Open();
                //cmd.Connection = con;
                //cmd.CommandText = "insert into admin(admin_filename,admin_filePath) values('" + fileName + "','../images/" + fileName + "')";
                //int dr = cmd.ExecuteNonQuery();
                //if (dr > 0)
                //{
                   
                //    Response.Write("<script> alert('Ok') </script>");
                //}
                //else
                //{
                //    Response.Write("<script> alert('Successful') </script>");
                //}
            }
        }

       
    }
}