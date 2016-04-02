<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CarSharing.Client.index" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Renting & Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../Files/My/index.css" />
    <link rel="stylesheet" href="../Files/My/CSS.css" />
    <script src="../Files/My/CreateRide.js"></script>
</head>
<body>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
            
        var lat1; var long1; var lat2; var long2;
        var date;
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

        function selectedDate(sender, args)
        {
            
        }
        function setValue()
        {
            var date = $('#<%= TextBox1.ClientID  %>').val();
            var fromDest = $('#<%= txtfrom.ClientID %>').val();
            var toDest = $('#<%= txtto.ClientID %>').val();

            window.location.replace("ShowRides.aspx?from=" + fromDest + "&to=" + toDest + "&date=" + date);
            return false;
        }
        function ridepost()
        {
            window.location = "CreateRide.aspx";
            return false;
        }

        function clearForm()
        {
            document.getElementById("txtfrom").value = null;
            document.getElementById("txtto").value = null;
            document.getElementById("TextBox1").value = null;
            return false;
        }

    </script>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
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

        <div class="container-fluid" id="back" style="padding-top:30px">
        <div class="col-lg-8">
           
        </div>
        <div class="col-lg-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span> Search Ride </span>
                </div>
                <div id="panelbody" class="panel-body">
                    <div class="form-group">
                        <label class="col-lg-3" for="txtfrom">From :</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtfrom" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" for="txtto">To :</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtto" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" for="txtdate">Date :</label>
                        <div class="col-lg-9">
                            <script src="../Files/My/Calender.min.js" type="text/javascript"></script>
                            <asp:TextBox ID="TextBox1" style="background-color:#fff" CssClass="disable_past_dates form-control" placeholder="MM/DD/YYYY" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="TextBox1_CalendarExtender" Format="dd/MM/yyyy" OnClientDateSelectionChanged="selectedDate" runat="server" TargetControlID="TextBox1"></asp:CalendarExtender>
                        </div>
                    </div>
                    
                </div>
                <div class="panel-footer">
                    <button type="submit" runat="server" onclick="return setValue()" class="btn btn-primary">Submit</button>
                    <button type="button" onclick="return clearForm()" class="btn btn-primary">Clear</button>
                </div>
            </div>

        </div>
        

    </div>

        <div class="container">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
  
    </form>
</body>
</html>
