<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RideDetails.aspx.cs" Inherits="CarSharing.Client.RideDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Renting & Sharing</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
     <link rel="stylesheet" href="../Files/My/index.css" />
    <script src="../Files/My/CreateRide.js"></script>
    <style>
        .form-group {
            margin-bottom:0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.aspx">
                        <span class="glyphicon glyphicon-home">Home
                        </span>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a id="myacc" class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
                            <ul id="showacc" class="dropdown-menu">
                                <li><a href="#">Edit Profile</a></li>
                                <li><a href="#">Settings</a></li>
                                <li><a href="#">My Cars</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
       <div class="container-fluid">
           <div class="col-lg-1"></div>
           <div class="col-lg-10">
                <div class="row">
                    <div id="divMap" style="height:250px;border-radius:16px;margin-bottom:10px"></div>
                </div>
               <div class="row">
                   <div style="border-radius:16px;">
                       <div style="border-radius:16px;border:1px solid black;" class="col-lg-9">
                          <div class="form-group">
                            <label class="col-lg-2">Car Name :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lblcname" runat="server"></asp:Label>
                                </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-2">Source :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lblsource" runat="server"></asp:Label>
                                </div>
                               <label class="col-lg-2">Destination :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lbldest" runat="server"></asp:Label>
                                </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-1 badge bg-info"> Journey :</label>
                               <label class="col-lg-4">Single</label>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-2" for="lbldepDate"> Date : </label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lbldDate" runat="server"></asp:Label>
                                </div>
                               <label class="col-lg-2" for="lbldepTime">Time :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lbldTime" runat="server"></asp:Label>
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-1 badge bg-info"> Journey :</label>
                               <label class="col-lg-4">Return</label>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-2" for="lblrDate"> Date :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lblrDate" runat="server"></asp:Label>
                                </div>
                               <label class="col-lg-2" for="lblrTime">Time :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lblrTime" runat="server"></asp:Label>
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-2" for="lblseats">Seats</label>
                               <div class="col-lg-4"> 
                                   <asp:Label ID="lblseats" runat="server"></asp:Label>
                               </div>
                               <label class="col-lg-2">Amount :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lblamt" runat="server"></asp:Label>
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-2">Phone No :</label>
                               <div class="col-lg-4">
                                   <asp:Label ID="lblphone" runat="server"></asp:Label>
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-2">Comment :</label>
                               <div class="col-lg-8" style="margin-bottom:20px;">
                                   <asp:TextBox ID="lblcomment" TextMode="MultiLine" BackColor="Transparent" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                               </div>
                           </div>
                           <div class="form-group">
                               <label class="col-lg-3">Enter no of Seats :</label>
                               <div class="col-lg-3">
                                   <asp:TextBox ID="txtseats" class="form-control" runat="server"></asp:TextBox>
                                   
                               </div>
                               <div class="col-lg-6"></div>
                           </div>
                           <div class="form-group">
                                <div class="col-lg-10" style="margin-top:25px;margin-bottom:25px">
                                    <asp:Button ID="btnRegister" style="float:right" runat="server" class="btn btn-success" OnClick="btnRegister_Click" Text="Request For Ride" />
                                </div>  
                           </div>
                         </div>
                       </div>
                       <div class="col-lg-3" style="text-align:center">     
                              <p style="margin-left:30%;margin-top:10%"><a href="Profile.aspx">
                              <asp:Image ID="image1" class="img-responsive" ImageUrl="~/Files/img/friends/fr-07.jpg" Width="150" runat="server" /></a></p>
                            <ul>                                 
                                 <asp:Label ID="lblname" Font-Bold="true" runat="server"></asp:Label><br />
                                 <a href="Profile.aspx" class="btn btn-info btn-lg">View Profile</a>
                            </ul>  
                       </div>
                   </div>
               </div>
           </div>
       
    </form>
    <footer>
        
    </footer>
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
            map = new google.maps.Map(document.getElementById('divMap'), mapOptions);
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


</body>
</html>