<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="ModifyAdmin.aspx.cs" Inherits="CarSharing.Admin.ModifyAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="server">
    
    <br /><br />

    <div class="row">

        <div class="col-lg-2"></div>

        <div class="col-lg-8">

            <div class="panel panel-default form-horizontal">
            
                <div class="panel-heading" style="text-align: center">
                    <h4>
                        <span>Edit Detail</span>
                    </h4>
                </div>

                <div class="panel-body dl-horizontal">

                    <div class="col-lg-1"></div>
                    
                    <div class="col-lg-10">
                        <div class="form-group">
                            <div class="col-lg-3">
                               <label class="control-label" id="lbl" for="lblid">ID :</label><br />
                                <label class="control-label" id="lbl1" for="lbluname">User Name :</label>
                            </div>
                            <div class="col-lg-3">
                                <asp:Label ID="lblid" class="control-label" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="lbluname" class="control-label" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-lg-6">
                                <asp:Image ID="imgProfile" ForeColor="DimGray" ImageUrl="demo.jpg" runat="server" Width="150" Height="120" />
                                <asp:FileUpload ID="fileUpload" EnableViewState="true" ViewStateMode="Enabled" class="pull-right" runat="server" /><br />
                                <asp:Button ID="btnupload" runat="server" class="btn btn-default" Text="Upload" />
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="col-lg-3">
                               
                            </div>
                            <div class="col-lg-9">
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label" id="lbl2" for="txtname">Name :</label>
                            </div>
                            <div class="col-lg-9">
                                <input type="text" id="txtname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label" id="lbl3" for="txtaddress">Address :</label>
                            </div>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label" id="lbl4" for="txtphone">Phone No :</label>
                            </div>
                            <div class="col-lg-9">
                                <input type="text" id="txtphone" class="form-control" />
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="col-lg-3">
                               <label class="control-label" id="lbl5" for="txtemail">Email :</label>
                            </div>
                            <div class="col-lg-9">
                                <input type="text" id="txtemail" class="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
            
            </div>

        </div>
        
        <div class="col-lg-2"></div>
    </div>


</asp:Content>
