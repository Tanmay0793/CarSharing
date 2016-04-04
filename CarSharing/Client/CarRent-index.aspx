<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarRent-index.aspx.cs" Inherits="CarSharing.Client.CarRent_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../Files/My/index.css" />
    <link rel="stylesheet" href="../Files/My/CSS.css" />
    <script src="../Files/My/CreateRide.js"></script>
    <link href="../Files/css/bootstrap.css" rel="stylesheet" />
    <link href="../Files/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../Files/css/style.css" rel="stylesheet" />
    <link href="../Files/css/style-responsive.css" rel="stylesheet" />
    <script src="../Files/js/chart-master/Chart.js"></script>
</head>
<body id="backRent" style="height=550px">
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
                       
                       
                        <li runat="server" id="l3"><a href="Login.aspx?location=index.aspx"><span class="glyphicon glyphicon-log-in"> Login</span> </a></li>
                        <li runat="server" id="l4"><a href="SignUp.aspx"><span class="glyphicon glyphicon-user"> SignUp</span> </a></li>                 
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid"  style="padding-top:30px">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 mb">
					<div class="content-panel pn">
						<div id="profile-01">
							<h3>Sharon Holmes</h3>
							<h6>WEB DESIGNER</h6>
				    	</div>
					
					<div class="centered">
						<h6><i class="fa fa-envelope"></i><br/>SHARON@DASHGUMTHEME.COM</h6>
					</div>
                        <div class="profile-01 centered">
					    <p><a href="index.aspx">Book Car</a></p>
				    </div>
				</div><! --/content-panel -->
			    </div><! --/col-md-4 -->
            </div>
         
        </div>
    </form>

    <script src="../Files/js/jquery.js"></script>
    <script src="../Files/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../Files/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../Files/js/jquery.scrollTo.min.js"></script>
    <script src="../Files/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../Files/js/jquery.sparkline.js"></script>

    <!--common script for all pages-->
    <script src="../Files/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="../Files/js/sparkline-chart.js"></script>    
    
</body>
</html>
