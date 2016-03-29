<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateRide.aspx.cs" Inherits="CarSharing.Client.CreateRide" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
    
</head>
<body style="background-color: azure">
    
    <form method="post" role="form" runat="server">
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
        <script>
            
            var directionsDisplay;
            var directionsService = new google.maps.DirectionsService();
            google.maps.event.addDomListener(window, 'load', function () {
                var places = new google.maps.places.Autocomplete(document.getElementById('txtfrom'));
                var toplace = new google.maps.places.Autocomplete(document.getElementById('txtto'));
                directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
            });
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var from = place.formatted_address;
                var lat1 = place.geometry.location.lat();
                var long1 = place.geometry.location.lng();
                alert(from,lat1, long1);
            });
            google.maps.event.addListener(toplace, 'place_changed', function () {
                var place = toplace.getPlace();
                to = place.formatted_address;
                lat2 = place.geometry.location.lat();
                long2 = place.geometry.location.lng();
            });

            function getMap() {
                var mumbai = new google.maps.LatLng(18.9750, 72.8258);
                var mapOptions = {
                    zoom: 7,    
                    center: mumbai
                };
                map = new google.maps.Map(document.getElementById('divmap'), mapOptions);
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
                        getDist();
                    } else {
                        alert("Unable to find the distance via road.");
                    }
                });
                    
              
                return false;
            }
               
            function getDist()
            {
             alert()   
            }


            
        </script>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3>Create Ride</h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-lg-8">
                            <label class=" badge bg-success">Step 1: </label>
                            &nbsp;<label> Add Vehicle</label>
                            <br />
                            <div class="form-group">
                                <label>Select Vehicle :</label><br />
                                <asp:DropDownList ID="ddlvehicle" AutoPostBack="true" OnSelectedIndexChanged="ddlvehicle_SelectedIndexChanged" class="form-control" runat="server"></asp:DropDownList><br />
                                Selected Car is : 
                                <asp:Label ID="lblvehicle" Font-Bold="true" Text="" runat="server"></asp:Label>
                            </div>
                            <hr />
                            <label class="badge bg-success">Step 2: </label>
                            &nbsp;<label> Add Trip</label><br />
                            <div class="form-group">
                                <label for="txtfrom">From :</label>
                                <asp:TextBox ID="txtfrom" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtto">To :</label>
                                <asp:TextBox ID="txtto" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <hr />

                            <div class="form-group">
                                <label>Type of Trip :</label>
                                <asp:RadioButtonList runat="server" ID="rbtntype" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="Single">Single &nbsp; &nbsp;</asp:ListItem>
                                    <asp:ListItem Value="Return">Return</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <label id="depa">Departure Details:</label>
                            <div id="divdepa" class="form-group">
                                <div class="col-lg-6">
                                    <label>Date :</label>
                                    <div class="row">
                                        <asp:TextBox ID="txtdepdate" ReadOnly="true" runat="server" class="col-lg-12 form-control">
                                        </asp:TextBox>
                                        <cc1:CalendarExtender ID="txtdepdate_CalendarExtender" Format="MM/dd/yyyy" runat="server" TargetControlID="txtdepdate">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <label>Time :</label>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="ddldhour" OnSelectedIndexChanged="ddldhour_SelectedIndexChanged" class="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1"> 1 </asp:ListItem>
                                                <asp:ListItem Value="2"> 2 </asp:ListItem>
                                                <asp:ListItem Value="3"> 3 </asp:ListItem>
                                                <asp:ListItem Value="4"> 4 </asp:ListItem>
                                                <asp:ListItem Value="5"> 5 </asp:ListItem>
                                                <asp:ListItem Value="6"> 6 </asp:ListItem>
                                                <asp:ListItem Value="7"> 7 </asp:ListItem>
                                                <asp:ListItem Value="8"> 8 </asp:ListItem>
                                                <asp:ListItem Value="9"> 9 </asp:ListItem>
                                                <asp:ListItem Value="10"> 10 </asp:ListItem>
                                                <asp:ListItem Value="11"> 11 </asp:ListItem>
                                                <asp:ListItem Value="12"> 12 </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="ddldmin" OnSelectedIndexChanged="ddlmin_SelectedIndexChanged" class="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="00"> 00 </asp:ListItem>
                                                <asp:ListItem Value="15"> 15 </asp:ListItem>
                                                <asp:ListItem Value="30"> 30 </asp:ListItem>
                                                <asp:ListItem Value="45"> 45 </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="ddldtime" OnSelectedIndexChanged="ddldtime_SelectedIndexChanged" class="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="AM"> AM </asp:ListItem>
                                                <asp:ListItem Value="PM"> PM </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <label style="padding-top: 30px" id="return">Return Details:</label>
                            <div id="divreturn" class="form-group">
                                <div class="col-lg-6">
                                    <label>Date :</label>
                                    <div class="row">
                                        <asp:TextBox ID="txtretdate" ReadOnly="true" runat="server" class="col-lg-12 form-control">
                                        </asp:TextBox>
                                        <cc1:CalendarExtender ID="txtretdate_CalendarExtender" Format="MM-dd-yyyy" runat="server" TargetControlID="txtretdate">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <label>Time :</label>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="ddlrhour" OnSelectedIndexChanged="ddlrhour_SelectedIndexChanged" class="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1"> 1 </asp:ListItem>
                                                <asp:ListItem Value="2"> 2 </asp:ListItem>
                                                <asp:ListItem Value="3"> 3 </asp:ListItem>
                                                <asp:ListItem Value="4"> 4 </asp:ListItem>
                                                <asp:ListItem Value="5"> 5 </asp:ListItem>
                                                <asp:ListItem Value="6"> 6 </asp:ListItem>
                                                <asp:ListItem Value="7"> 7 </asp:ListItem>
                                                <asp:ListItem Value="8"> 8 </asp:ListItem>
                                                <asp:ListItem Value="9"> 9 </asp:ListItem>
                                                <asp:ListItem Value="10"> 10 </asp:ListItem>
                                                <asp:ListItem Value="11"> 11 </asp:ListItem>
                                                <asp:ListItem Value="12"> 12 </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="ddlrmin" OnSelectedIndexChanged="ddlrmin_SelectedIndexChanged" class="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="00"> 00 </asp:ListItem>
                                                <asp:ListItem Value="15"> 15 </asp:ListItem>
                                                <asp:ListItem Value="30"> 30 </asp:ListItem>
                                                <asp:ListItem Value="45"> 45 </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="ddlrtime" OnSelectedIndexChanged="ddlrtime_SelectedIndexChanged" class="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="AM"> AM </asp:ListItem>
                                                <asp:ListItem Value="PM"> PM </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <hr />
                            <div class="form-group">
                                <label>Available Seats :</label>
                                <asp:TextBox ID="txtseats" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtamt">Amount :</label>
                                <asp:TextBox ID="txtamt" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Phone No :</label>
                                <asp:TextBox ID="txtphone" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Comments :</label>
                                <asp:TextBox ID="txtcomment" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnsave" class="btn btn-primary" OnClick="btnsave_Click" runat="server" Style="float: right" Text="Create" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div id="divmap" class="jumbotron" style="height: 400px">
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
