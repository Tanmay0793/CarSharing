<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoQury.aspx.cs" Inherits="CarSharing.DemoQury" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <style>
        .form-group {
            margin-bottom:0;
        }
    </style>
</head>
<body>
     <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">

        var source, destination;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        
        var qs = (function (a) {
            if (a == "") return {};
            var b = {};
            for (var i = 0; i < a.length; ++i) {
                var p = a[i].split('=', 2);
                if (p.length == 1)
                    b[p[0]] = "";
                else
                    b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
            }
            return b;
        })(window.location.search.substr(1).split('&'));

        
       
        google.maps.event.addDomListener(window, 'load', function () {
            directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });

            


            var pune = new google.maps.LatLng(18.5204, 73.8567);
                var mapOptions = {
                    zoom: 7,
                    center: pune
                };
                map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
                directionsDisplay.setMap(map);

                source = qs["from"];
                destination = qs["to"];
               

                var request = {
                    origin: source,
                    destination: destination,
                    travelMode: google.maps.TravelMode.DRIVING
                };

                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                    }
                });

                var service = new google.maps.DistanceMatrixService();
                service.getDistanceMatrix({
                    origins: [source],
                    destinations: [destination],
                    travelMode: google.maps.TravelMode.DRIVING,
                    unitSystem: google.maps.UnitSystem.METRIC,
                    avoidHighways: false,
                    avoidTolls: false
                }, function (response, status) {
                    if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {

                    } else {
                        alert("Unable to find the distance via road.");
                    }
                });

        });

       
    </script>

    <form id="form1" runat="server">
        <div class="container-fluid" style="margin-top:45px">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="row">
                    <div runat="server" class="col-lg-8">
                        <h1>Rides</h1>
                        <div style="height:70px;background-color:wheat;margin-bottom:10px">
                            <div class="form-group">
                                <div class="col-lg-1"></div>
                              
                                <div class="col-lg-4">
                                Source: <asp:TextBox ID="txtsource" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-4">
                                  Destination:  <asp:TextBox ID="txtdest" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Button runat="server" Text="Search" class="btn btn-success" />
                                </div>
                            </div>
                        </div>
                        <div id="divtag" runat="server">
                          
                        </div>
                   </div>>
                     <div class="col-lg-4">
                        
                        <div class="jumbotron" id="dvMap" style="height:350px"></div>
                    </div>
                </div>                
            </div>
        </div>
    </form>
</body>
</html>



