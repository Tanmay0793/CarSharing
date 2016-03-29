<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarSharing.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../Files/css/Style1.css" />
    <link rel="stylesheet" href="../Files/My/Login.css" />

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

        var loc=qs["location"];

        function getValue() {
            
            var email = $('#<%= txtUser.ClientID %>').val();
            var pass = $('#<%= txtPass.ClientID %>').val();
            if (pass.length > 5) {
                PageMethods.setValue(email, pass, onSucceed, onError);
            }
            else {
                alert("Password should be more than 5 digits...");
            }
            return false;
        }

        function onSucceed(result) {

            if (result[0] != "No Data")
            {
                if (result[1] == "" && result[2] == "")
                {
                    window.location.replace("Registration.aspx?userid=" + result[0]);
                }
                else if (result[1] != "" && result[2] != "" && loc != null) {
                    window.location.replace(loc);
                }
                else {
                    window.location.replace("index.aspx");
                }
            }
               
        }

        function onError(result) {
            alert("Error :" + result.error_getmessage());
        }

        function funTrans() {
           
            window.location = '<%= ResolveUrl("SignUp.aspx") %>';
            return false;
        }

    </script>

</head>
<body style="">
    <div id="divBack" class="container-fluid bg-1 text-center">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div  class="panel-heading">Login</div>
                    <div class="panel-body">
                        <form role="form" runat="server">
                          <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
                            <label for="txtUser">Email :</label>
                          <div class="input-group">
                             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="txtUser" class="form-control" placeholder="Email" ViewStateMode="Disabled" TextMode="Email"  runat="server"></asp:TextBox>
                          </div> 
                            <br />

                          <label for="txtPass">Password :</label>
                          <div class="input-group">
                             <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                              <asp:TextBox ID="txtPass" TextMode="Password" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                          </div>
                            
                             <br />
                            <div>
                                <asp:CheckBox ID="chkbox" class="pull-left" Text="Remember Me"  Checked="true" runat="server" />
                                <a href="ForgotPassword.aspx" style="float:right" >Forgot Password</a>
                            </div>
                            <br />
                            <asp:Label ID="lblError" runat="server" style="color:red;background-color:black" Visible="true"></asp:Label>
                            <br />
                            
                            <asp:Button ID="btnLogin" class="btn btn-default btn-success pull-right" BackColor="Gray" Text="Login" OnClientClick="return getValue()" runat="server" />
                            <asp:Button ID="btnSignUp" class="btn btn-default btn-success pull-right" BackColor="Gray" Text="Sign Up" runat="server" OnClientClick="return funTrans()" />
                       
                        </form>
                    </div>
                </div> 
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

    
</body>
</html>
