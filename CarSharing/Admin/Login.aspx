<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarSharing.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../Files/css/Style1.css" />
    <script type="text/javascript">

        function getValue()
        {
            var email = $('#<%= txtUser.ClientID %>').val();
            var pass = $('#<%= txtPass.ClientID %>').val();
            if (pass.length>=4) {
                PageMethods.setValue(email, pass, onSucceed, onError);
            }
            return false;
        }

        function onSucceed(result)
        {
           
            window.location.replace("index.aspx?userid=" + result);
        }

        function onError(result)
        {
            alert("Error :" + result.error_getmessage());
        }


    </script>


</head>
<body runat="server">
    <div class="container-fluid bg-1 text-center">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div  class="panel-heading">Login</div>
                    <div class="panel-body">
                        <form role="form" runat="server" method="post">
                            <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server">
                            </asp:ScriptManager>
                          <label for="txtUser">Email :</label>
                          <div class="input-group">
                             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="txtUser" class="form-control" placeholder="Email" TextMode="Email"  runat="server"></asp:TextBox>
                          </div> 
                            <br />

                          <label for="txtPass">Password :</label>
                          <div class="input-group">
                             <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                              <asp:TextBox ID="txtPass" TextMode="Password" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                          </div>
                            
                             <br />
                            <div>
                                <asp:CheckBox ID="chkbox" class="pull-left" Text="Remember Me" runat="server" />
                                <a href="ForgotAdmin" style="float:right" >Forgot Password</a>
                            </div>
                            <br />
                            <asp:Label ID="lblError" runat="server" style="color:red;background-color:black" Visible="true"></asp:Label>
                            <br />
                            
                            <button type="submit" id="submit" class="btn btn-success pull-right" style="color:black;background-color:transparent"  onclick="return getValue()">Login</button>
                            
                            <asp:Button ID="btnSignUp" class="btn btn-default btn-success pull-right" style="color:black" BackColor="Transparent" Text="Sign Up" runat="server" />
                       
                        </form>
                    </div>
                </div> 
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</body>
</html>
