﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
namespace CarSharing.Client
{
    public partial class ShowRides : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                if (Request["from"] != null)
                {
                    SearchData(Request["from"].ToString(), Request["to"].ToString(), Request["date"].ToString());
                }
                if (Session["id"] == null)
                {
                    l2.Visible = false;
                    l3.Visible = true;
                    l4.Visible = true;
                }
                else
                {
                    l2.Visible = true;
                    l3.Visible = false;
                    l4.Visible = false;
                }
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchData(txtsource.Text, txtdest.Text, Request["date"].ToString());
        }


        void SearchData(string from,string to, string date)
        {

            txtsource.Text = from;
            txtdest.Text = to;
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_searchRide";
            cmd.Parameters.AddWithValue("@from", from);
            cmd.Parameters.AddWithValue("@to", to);
            cmd.Parameters.AddWithValue("@date", date);
            string strdata = "";
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strdata += "<div id='first' runat='server' style='height:200px;font-size:15px;background-color:whitesmoke;margin-bottom:10px;border-radius:16px'> " +
                        "<div class='form-group'>" +
                            "<label class='col-lg-2'>Name :</label>" +
                            "<div class='col-lg-4'>" +
                                "<asp:Label runat='server'>" + dt.Rows[i]["name"] + "</asp:Label>" +
                            "</div>" +
                            "<label class=col-lg-2>Car Name :</label>" +
                            "<div class='col-lg-4'>" +
                                "<asp:Label runat='server'>" + dt.Rows[i]["Car"] + "</asp:Label>" +
                            "</div>" +
                        "</div>" +

                        "<div class='form-group'>" +
                                "<label class='col-lg-2'>Journey :</label>" +
                                "<div class='col-lg-10'>" +
                                    "<asp:Label runat='server'>" + dt.Rows[i]["trip_type"] + "</asp:Label>" +
                                "</div>" +
                        "</div>" +
                        "<div class='form-group'>" +
                            "<label class='col-lg-2'>Date :</label>" +
                            "<div class='col-lg-4'>" +
                                "<asp:Label runat='server'>" + dt.Rows[i]["DepaDate"] + "</asp:Label>" +
                            "</div>" +
                            "<label class='col-lg-2'>Time :</label>" +
                            "<div class='col-lg-4'>" +
                                "<asp:Label runat='server'>" + dt.Rows[i]["depaTime"] + "</asp:Label>" +
                            "</div>" +
                        "</div>" +
                        "<div class='form-group'>" +
                            "<label class='col-lg-2'>Seats :</label>" +
                            "<div class='col-lg-4'>" +
                                "<asp:Label runat='server'>" + dt.Rows[i]["seats"] + "</asp:Label>" +
                            "</div>" +
                            "<label class='col-lg-2'>Amount :</label>" +
                            "<div class='col-lg-4'>" + dt.Rows[i]["amtperson"] + " Rs/Person</div>" +
                        "</div>" +
                        "<div class='form-group'>" +
                            "<div class='col-lg-8'></div>" +
                            "<div class='col-lg-2'>" +
                                "<a href='RideDetails.aspx?name=" + dt.Rows[i]["name"] + "&Car=" + dt.Rows[i]["Car"] + "&from="
                                    + dt.Rows[i]["fromloc"] + "&to=" + dt.Rows[i]["toloc"] + "&type=" + dt.Rows[i]["trip_type"] +
                                        "&Ddate=" + dt.Rows[i]["DepaDate"] + "&Dtime=" + dt.Rows[i]["depaTime"] +
                                            "&Rdate=" + dt.Rows[i]["RetDate"] + "&Rtime=" + dt.Rows[i]["returnTime"] +
                                                "&seat=" + dt.Rows[i]["seats"] + "&amount=" + dt.Rows[i]["amtperson"] +
                                                    "&phone="+dt.Rows[i]["phoneno"] + "&image="+dt.Rows[i]["FilePath"]+
                                                    "&comments=" + dt.Rows[i]["comments"] +"&driver_id="+dt.Rows[i]["driverID"] + "&ride_ID="+dt.Rows[i]["RideID"]+ "' class='btn btn-success'>Select</a>" +
                            "</div>" +
                            "<div class='col-lg-2'></div>" +
                        "</div>" +
                    "</div>";
            }
            divtag.InnerHtml = strdata;
                   
        
        }
    }
}