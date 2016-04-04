<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CarSharing.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Files/css/bootstrap.min.css" />
    <script src="../Files/js/bootstrap.min.js"></script>
    <script src="../Files/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="../Files/css/Style1.css" />
    <script src="../Files/My/Validation.js"></script>
    <script type="text/javascript">

        function getValue() {
            var vname = $('#<%= name.ClientID %>').val();
            var vphone = $('#<%= phone.ClientID %>').val();
            var vemail = $('#<%= mail.ClientID %>').val();
            var vpass = $('#<%= pass.ClientID %>').val();
            var rpass = $('#<%=repass.ClientID %>').val();
            if (vpass === rpass && vpass.length > 5 && vphone.length > 9 && vphone.length < 11) {
                PageMethods.setValue(vname, vphone, vemail, vpass, onSucceed, onError);
                return false;
            }
        }
        function onSucceed(res) {
            alert(res);
            if (res == "success") {
                window.location = '<%= ResolveUrl("Login.aspx") %>';
            }
            alert("Error :" + res.get_message());
        }
        function onError(res) {
            alert("Error : " + res.get_message());
        }
        function trans() {
            window.location = '<%= ResolveUrl("Login.aspx") %>';
        }
    </script>

</head>
<body>
    <div class="container-fluid" style="padding-top: 35px">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form role="form" runat="server">
                <div class="panel panel-primary">
                    <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
                    <div class="panel-heading">Sign Up</div>
                    <div class="panel-body">
                        <label for="txtname">Name:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" id="name" class="form-control" placeholder="Enter Name" runat="server" required="required" />

                        </div>
                        <br />
                        <label for="txtphone">Phone No:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input type="text" id="phone" runat="server" class="form-control" placeholder="Enter Phone" required="required" />

                        </div>
                        <asp:Label ID="lblphone" runat="server" class="pull-right" ForeColor="Red"></asp:Label><br />
                        <label for="txtmail">Email:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input type="email" id="mail" runat="server" class="form-control" placeholder="Enter E-mail" required="required" />

                        </div>
                        <br />
                        <label for="txtpass">Password:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="pass" runat="server" class="form-control" placeholder="Enter pass"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblpass" runat="server" class="pull-right" ForeColor="Red"></asp:Label><br />
                        <label for="txtrepass">Re-Enter Password:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" id="repass" runat="server" class="form-control" placeholder="Enter Re-Password" required="required" />
                        </div>
                        <asp:Label ID="lblrpass" runat="server" class="pull-right" ForeColor="Red"></asp:Label><br />
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="btnregister" class="btn btn-primary" runat="server" OnClientClick="return getValue()" Text="Register" />
                        <asp:Button ID="btnLogin" class="btn btn-primary" runat="server" OnClientClick="return trans()" Text="Back to Login" />
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</body>
</html>
