using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarSharing
{
    public partial class DemoQury : System.Web.UI.Page
    {
        string str = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 4; i++)
            {
                str += "<div id='first' runat='server' style='height:200px;font-size:15px;background-color:gray;margin-bottom:10px;border-radius:16px'> " +
                                    "<div class='form-group'>" +
                                        "<label class='col-lg-2'>Name :</label>" +
                                        "<div class='col-lg-4'>" +
                                            "<asp:Label runat='server'>Tanmay Dhamnekar</asp:Label>" +
                                        "</div>" +
                                        "<label class=col-lg-2>Car Name :</label>" +
                                        "<div class='col-lg-4'>" +
                                            "<asp:Label runat='server'>MARUTI 800</asp:Label>" +
                                        "</div>" +
                                    "</div>" +

                                    "<div class='form-group'>" +
                                            "<label class='col-lg-2'>Journey :</label>" +
                                            "<div class='col-lg-10'>" +
                                                "<asp:Label runat='server'>Single</asp:Label>" +
                                            "</div>" +
                                    "</div>" +
                                    "&nbsp;&nbsp;<label class='badge bg-primary'>Single</label>" +
                                    "<div class='form-group'>" +
                                        "<label class='col-lg-2'>Date :</label>" +
                                        "<div class='col-lg-4'>" +
                                            "<asp:Label runat='server'>03-31-2016</asp:Label>" +
                                        "</div>" +
                                        "<label class='col-lg-2'>Time :</label>" +
                                        "<div class='col-lg-4'>" +
                                            "<asp:Label runat='server'>5 : 30 PM</asp:Label>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='form-group'>" +
                                        "<label class='col-lg-2'>Seats :</label>" +
                                        "<div class='col-lg-4'>" +
                                            "<asp:Label runat='server'>64</asp:Label>" +
                                        "</div>" +
                                        "<label class='col-lg-2'>Amount :</label>" +
                                        "<div class='col-lg-4'>805.00</div>" +
                                    "</div>" +
                                    "<div class='form-group'>" +
                                        "<div class='col-lg-8'></div>" +
                                        "<div class='col-lg-2'>" +
                                            "<a href='DemoModal.aspx?userid="+i+"' class='btn btn-success'>Select</a>" +
                                        "</div>" +
                                        "<div class='col-lg-2'></div>" +
                                    "</div>" +
                                "</div>";
            }
            divtag.InnerHtml = str;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }

    }
}