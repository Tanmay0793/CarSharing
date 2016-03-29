using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSharing.Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              //  labelid.InnerText = "User01";
                labelname.InnerText = "Tanmay";
             //   lblid.Enabled = false;
                //txtname.Enabled = false;
                //txtemail.Enabled = false;
                btnAdd.Text = "Edit";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //txtname.Enabled = true;
            //txtemail.Enabled = true;
            //btnAdd.Text = "Save";
        }
    }
}