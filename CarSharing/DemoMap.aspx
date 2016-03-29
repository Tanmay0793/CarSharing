<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoMap.aspx.cs" Inherits="CarSharing.DemoMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>

    
</head>
<body>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
        var from; var to; var lat1; var long1; var lat2; var long2;
        var source, destination;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();


        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('txtfrom'));
            var toplace = new google.maps.places.Autocomplete(document.getElementById('txtto'));
            directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
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

        function getMap()
        {
            var mumbai = new google.maps.LatLng(18.9750, 72.8258);
            var mapOptions = {
                zoom: 7,
                center: mumbai
            };
            map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
            directionsDisplay.setMap(map);
            
            source = document.getElementById("txtfrom").value;
            destination = document.getElementById("txtto").value;
            
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

            return false;
        }

        function getValue()
        {
            PageMethods.setValue(lat1, long1, lat2, long2, from, to, onSucceed, onError);
            return false;
        }

        function onSucceed(result) {
            alert(result+" KM");
        }

        function onError(result) {
            alert("Error :" + result.error_getmessage());
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
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClientClick="return getValue()" class="btn btn-primary" />
                    <asp:Button ID="Button1" runat="server" Text="Show Map" OnClientClick="return getMap()" class="btn btn-primary" />
                </div>
            </div>

        </div>
        <div class="col-lg-1"></div>

    </div>
    </form>
</body>
</html>
