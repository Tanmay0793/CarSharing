using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
namespace CarSharing
{
    public partial class DemoMap : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string setValue(double lat1,double long1,double lat2,double long2,string from,string to)
        {
            string val = "fail";
            double distances = distance(lat1, long1, lat2, long2);
            string dist = Math.Round(distances).ToString();
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringDb"].ToString());
            //SqlDataAdapter sda = new SqlDataAdapter("insert into DemoPlace(frm,frm_lat,frm_long,to_place,to_lat,to_long,distance) values('" + from + "'," + lat1 + "," + long1 + ",'" + to + "'," + lat2 + "," + long2 + "," + dist + ")", con);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    val = "success";
            //}
            return dist;
        }
        
        public static double distance(double lat1,double long1,double lat2,double long2)
        {
            double theta = long1 - long2;
            double dist = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * Math.Cos(deg2rad(theta));
            dist = Math.Acos(dist);
            dist = rad2deg(dist);
            dist = dist * 60 * 1.1515;
            dist = dist * 1.609344;
            return dist;
        }

        public static double deg2rad(double deg)
        {
            return (deg * Math.PI / 180.0);
        }

        public static double rad2deg(double rad)
        {
            return (rad / Math.PI * 180.0);
        }

    }
}