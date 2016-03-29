<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowRides.aspx.cs" Inherits="CarSharing.Client.ShowRides" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Renting & Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
     <link rel="stylesheet" href="../Files/My/index.css" />
    <style>
        .form-group {
            margin-bottom:0;
        }
    </style>
    <script type="text/javascript">
        function ridepost() {
            window.location = "CreateRide.aspx";
            return false;
        }
    </script>
</head>
<body id="divRideback">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
       
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
            var places = new google.maps.places.Autocomplete(document.getElementById('txtsource'));
            var toplace = new google.maps.places.Autocomplete(document.getElementById('txtdest'));

            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
               
            });
            google.maps.event.addListener(toplace, 'place_changed', function () {
                var place = toplace.getPlace();
               
            });
        });

    </script>

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
                        <span class="glyphicon glyphicon-home">
                        Home
                        </span>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li id="l1" runat="server"><asp:Button runat="server" class="btn navbar-btn" OnClientClick="return ridepost()" Text="Post Ride" /></li>
                        <li runat="server" id="l2" class="dropdown">
                            <a id="myacc" class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
                            <ul id="showacc" class="dropdown-menu">
                                <li><a href="#">Edit Profile</a></li>
                                <li><a href="#">Settings</a></li>
                                <li><a href="#">My Cars</a></li>
                            </ul>
                        </li>
                        <li runat="server" id="l3"><a href="Login.aspx?location=index.aspx"><span class="glyphicon glyphicon-log-in"> Login</span> </a></li>
                        <li runat="server" id="l4"><a href="SignUp.aspx"><span class="glyphicon glyphicon-user"> SignUp</span> </a></li>                 
                    </ul>
                </div>
            </div>
        </nav>
    
        <div class="container-fluid" style="margin-top:45px">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div runat="server" class="col-lg-8">
                        <h1 style="color:white">Rides</h1>
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
                                    <label>   </label>
                                    <asp:Button class="btn btn-info" runat="server" Text="Search" ID="btnSearch" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </div>
                        <div id="divtag" runat="server">

                            
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
            

    </form>
</body>
</html>
