<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoModal.aspx.cs" Inherits="CarSharing.DemoModal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
</head>
<body>
     <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    
    <script type="text/javascript">
            
        var from; var to; var lat1; var long1; var lat2; var long2;

        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('txtfrom'));
            var toplace = new google.maps.places.Autocomplete(document.getElementById('txtto'));

            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                from = place.formatted_address;
                lat1 = place.geometry.location.lat();
                long1 = place.geometry.location.lng();
            });
            google.maps.event.addListener(toplace, 'place_changed', function () {
                var place = toplace.getPlace();
                to = place.formatted_address;
                lat2 = place.geometry.location.lat();
                long2 = place.geometry.location.lng();
            });
        });


        function setValue()
        {
        
            window.location.replace("DemoQury.aspx?from=" + from+"&to="+to);
            return false;
        }

    </script>



   <form id="form1" runat="server">
    <div class="container-fluid" style="padding-top:60px">
    <asp:ScriptManager runat="server" EnablePageMethods="true">

    </asp:ScriptManager>
        <div class="col-lg-6">
             <div id="dvMap" style="width: 500px; height: 500px">
                </div>
        </div>
        <div class="col-lg-5">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span> Map </span>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-lg-3" for="txtfrom">From :</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtfrom" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div><br /><br />
                    <div class="form-group">
                        <label class="col-lg-3" for="txtto">To :</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtto" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnsubmit" runat="server" OnClientClick="return setValue()" Text="Submit" class="btn btn-primary" />
                    
                </div>
            </div>

        </div>
        <div class="col-lg-1"></div>

    </div>
    </form>
</body>
</html>
