using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSharing.Client
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

       
    }
}