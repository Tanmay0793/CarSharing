<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CarSharing.Registration1" %>

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
    <script src="../Files/My/Validation.js"></script>
    <script>
        $(document).ready(function () {
            $("#btnSave").click(function () {

                var country = $("#drpcountry");
                if (country.val() == "") {
                    alert("Please select an option!");
                    return false;
                }

            });

        });

    </script>


</head>
<body>

      
    <form role="form" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
        <div class="col-lg-12" id="header">XYZ</div>
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
    
            
                <div class="panel panel-default form-horizontal">
                    <div class="panel-heading" style="text-align: center">
                        <h4>
                            <span>Registration Form</span>
                        </h4>
                    </div>
                    <div class="panel-body dl-horizontal">
                      
                        <div class="form-group">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="col-lg-6 control-label" for="txtname">User Name:</label>
                                            <div class="col-lg-6">
                                                 <asp:TextBox ID="txtuname" runat="server" class="form-control" placeholder="Enter Username"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group" style="text-align:right">

                                            <asp:Label ID="lblstatus" runat="server" Font-Bold="true" Visible="true"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-6 control-label" for="txttype">User Type:</label>
                                            <div class="col-lg-6">
                                                <asp:DropDownList class="form-control" ID="drptype" runat="server">
                                                <asp:ListItem Value="Admin" Selected="True">Admin</asp:ListItem>
                                                <asp:ListItem Value="User">User</asp:ListItem>
                                            </asp:DropDownList>
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="col-lg-6">
                                            <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" class="btn btn-primary pull-right" Text="Search" />

                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Image ID="imgProfile" ForeColor="DimGray" runat="server" ImageUrl="Demo.jpg" Width="150" Height="100" />
                                            <asp:FileUpload ID="fileUpload" EnableViewState="true" ViewStateMode="Enabled" runat="server" />    
                                            <asp:Button ID="btnupload" runat="server" class="btn btn-default" OnClick="btnupload_Click" Text="Upload" />
                                        </div>
                                    </div>
                                </div>
                              
                                

                                <div class="form-group">
                                    <label class=" col-lg-3 control-label" for="txtnm">Admin Name:</label>
                                    <div class="col-lg-7">
                                        <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="lblname" class="pull-left"  ForeColor="Red" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="txtaddress">Address:</label>
                                    <div class="col-lg-7">
                                        <asp:TextBox ID="txtaddress"  runat="server" TextMode="MultiLine" class="form-control" placeholder="Enter Address" Columns="44"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="drpcountry">Country:</label>
                                    <div class="col-lg-3">
                                        <asp:DropDownList ID="drpcountry" OnSelectedIndexChanged="drpcountry_SelectedIndexChanged" runat="server" AutoPostBack="true" class="form-control">
                                        </asp:DropDownList>

                                    </div>
                                    <label class="col-lg-3 control-label" for="txtemail">State:</label>
                                    <div class="col-lg-3">

                                        <asp:DropDownList ID="drpState" OnSelectedIndexChanged="drpState_SelectedIndexChanged" runat="server" AutoPostBack="true" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="txtemail">City:</label>
                                    <div class="col-lg-3">
                                        <asp:DropDownList ID="drpCity" OnSelectedIndexChanged="drpCity_SelectedIndexChanged" runat="server" AutoPostBack="true" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                
                                    <label class="col-lg-3 control-label" for="txtemail">Area:</label>
                                    <div class="col-lg-3">

                                        <asp:DropDownList ID="drpArea" OnSelectedIndexChanged="drpArea_SelectedIndexChanged" runat="server" AutoPostBack="true" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="txtphone">Phone No:</label>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtxphone" runat="server" class="form-control" placeholder="Enter Phone"></asp:TextBox>
                                        <asp:Label ID="lblphone" class="pull-right"  ForeColor="Red" runat="server" Text=""></asp:Label>
                                    </div>
                                
                                    <label class="col-lg-3 control-label" for="txtemail">Email:</label>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtemail" runat="server" TextMode="Email" class="form-control" placeholder="Enter Email"></asp:TextBox>
                                        <asp:Label ID="lblemail" class="pull-right"  ForeColor="Red" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="rbtnsex">Sex:</label>
                                    <div class="col-lg-3">
                                        <asp:RadioButtonList RepeatDirection="Horizontal"  TextAlign="Left" ID="rbtnsex" runat="server">
                                            <asp:ListItem Value="Male" Text="Male"> </asp:ListItem>
                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    
                                    <label class="col-lg-3 control-label" for="drpbrand">Car Brand</label>
                                    <div class="col-lg-3">
                                        <asp:DropDownList ID="drpbrand" class="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="txtcar">Car Name:</label>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtcar" runat="server" class="form-control" placeholder="Enter car name"></asp:TextBox>
                                    </div>
                                </div>
                               <!-- <div class="form-group">
                                    <label class="col-lg-3 control-label" for="txtpassc">Password:</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password" class="form-control" placeholder="Enter Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="txtpass">Re-Password:</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtrepass" runat="server" TextMode="Password" class="form-control" placeholder="Enter again Password"></asp:TextBox>
                                    </div>
                                </div>
                                !-->
                                <div class="form-group">
                                    <label class="col-lg-3 control-label" for="chkstatus">Status:</label>
                                    <div class="col-lg-9">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="checkActive" runat="server" value="1" checked="checked" />
                                            Active
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-offset-2">
                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" class="btn btn-primary" Text="Save" />
                                        <button id="btnCancel" runat="server" class="btn btn-danger">Cancel</button>
                                        <asp:HiddenField ID="hidden" runat="server" />
                                    </div>
                                </div>
                              
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                       
                    </div>
                </div>
            </div>
            
            <div class="col-lg-2"></div>
        </div>
                 </ContentTemplate>
         <Triggers>
             <asp:PostBackTrigger ControlID="btnsearch" />
         </Triggers>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
            </Triggers>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnupload" />
            </Triggers>
  </asp:UpdatePanel>
    </form>
 
</body>
</html>
