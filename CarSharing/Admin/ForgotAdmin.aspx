<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotAdmin.aspx.cs" Inherits="CarSharing.Admin.ForgotAdmin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Sharing</title>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../Files/css/Style1.css" />
    <style>
        .panel 
        {
            width:auto;
            border:double;  
            background-color: rgba(243, 237, 237, 0.39);
            color:white !important;
        }
        .panel-heading 
        {
            text-decoration:underline;
             margin-top:0;
            text-align:center;
            font-weight:bold;
            font-size:xx-large;
            color:black;
            line-height:normal;
        }
        .panel-body 
        {
            font-weight:bolder;
            color:black;
        }
    </style>
</head>
<body style="background-image:url('/../images/spped.jpg')">
    <div class="container" style="padding-top:20px" >
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                        <asp:Image runat="server" ImageUrl="~/images/logo.jpg" class="img img-responsive" Height="150" Width="700" />
                <div class="panel panel-primary" style="margin-top:20px;margin-bottom:auto" >
                    <div class="panel-heading">Forgot Password</div><br />
                    <div class="panel-body">
                        <p style="font-size:larger"> Forgot Your Password ..?</p>
                            <p>Enter Your email address to recover your password.</p>
                        <form role="form" runat="server">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtemail" class="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                            </div>
                            <br /><br />
                             <asp:Button ID="submit"  class="btn btn-default btn-success btn-block " Text="Send Password" runat="server" />
                              <br />
                                     
                                
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</body>
</html>
