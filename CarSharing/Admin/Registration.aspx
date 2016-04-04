<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CarSharing.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="server">

    <script type="text/javascript">

        function funtrans() {
            window.location = '<%= ResolveUrl("index.aspx") %>'
            return false;
        }

    </script>
    <br />
    <br />

    <asp:ScriptManager ID="scriptmgr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            

             <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="panel panel-default form-horizontal">
                        <div class="panel-heading" style="text-align:center">
                            <h4>
                                <span>Admin</span>
                            </h4>
                        </div>
                        <div class="panel-body dl-horizontal">
                            <div class="form-group">
                                <div class="col-lg-1"></div>
                                <div class="col-lg-10">
                                    <div class="form-group">
                                        <div class="col-lg-3 control-label">
                                            <label  class="control-label" for="txtname">User Name:</label><br /><br />
                                            <label class="control-label" for="txttype">User Type:</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <asp:TextBox ID="txtusername" runat="server" class="form-control" placeholder="Enter Username"></asp:TextBox>
                                            <asp:Label ID="lblok" Text="Available" runat="server" Font-Bold="true" ForeColor="Green" Visible="false"></asp:Label>
                                            <br />
                                             <asp:DropDownList class="form-control" ID="drptype" runat="server">
                                                <asp:ListItem Value="Admin" Selected="True">Admin</asp:ListItem>
                                                <asp:ListItem Value="User">User</asp:ListItem>
                                            </asp:DropDownList>
                                        
                                        </div>
                                        <div class="col-lg-2">
                                            <asp:Button ID="btnsearch" runat="server" class="btn btn-primary pull-right" Text="Search" OnClick="btnsearch_Click" />
                                             
                                        </div>
                                        <div class="col-lg-4">
                                           <asp:Image ID="imgProfile" ForeColor="DimGray" runat="server" Width="150" Height="120" />                                        
                                           <asp:FileUpload ID="fileUpload" EnableViewState="true" ViewStateMode="Enabled" class="pull-right" runat="server" /><br />
                                            <asp:Button ID="btnupload" runat="server" class="btn btn-default" OnClick="btnupload_Click" Text="Upload" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-4"></div>
                                       
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtnm">Admin Name:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtaddress">Address:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" class="form-control" placeholder="Enter Address"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="drpcountry">Country:</label>
                                        <div class="col-lg-9">

                                            <asp:DropDownList ID="drpcountry" runat="server" OnSelectedIndexChanged="drpcountry_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtemail">State:</label>
                                        <div class="col-lg-9">

                                            <asp:DropDownList ID="drpState" runat="server" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtemail">City:</label>
                                        <div class="col-lg-9">
                                            <asp:DropDownList ID="drpCity" runat="server" OnSelectedIndexChanged="drpCity_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <label class="col-lg-3 control-label" for="txtemail">Area:</label>
                                        <div class="col-lg-9">

                                            <asp:DropDownList ID="drpArea" runat="server" OnSelectedIndexChanged="drpArea_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtphone">Phone No:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtxphone"  runat="server" class="form-control" placeholder="Enter Phone"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtemail">Email:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtemail" runat="server" TextMode="Email" class="form-control" placeholder="Enter Email"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="rbtnsex">Sex:</label>
                                        <div class="col-lg-9">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" TextAlign="Left" ID="rbtnsex" runat="server">
                                                <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                     
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtpassc">Password:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtpass" runat="server" TextMode="Password" class="form-control" placeholder="Enter Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtpass">Re-Password:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtrepass" runat="server" TextMode="Password" class="form-control" placeholder="Enter again Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label" for="txtcar">Car Name:</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="txtcar" runat="server" class="form-control" placeholder="Enter car name"></asp:TextBox>
                                        </div>
                                    </div>
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
                                            <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                                            <button id="btnCancel" runat="server" class="btn btn-danger" onclick="return funtrans()">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnupload" />
        </Triggers>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
