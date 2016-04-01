<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CarSharing.Admin.Profile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    
    <br /><br />
    <div class="row">

        <div class="col-lg-1"></div>

        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                       <h4>
                           <span>Profile</span>
                       </h4>
                </div>
                <div class="panel-body">
                    <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-lg-3">ID :</label>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" class="form-control" ID="lblID"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3">Name :</label>
                            <div class="col-lg-9">
                                <asp:Label runat="server" ID="lblName"></asp:Label>
                            </div>
                        </div>
                        </div>
                        <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3">User Name :</label>
                            <div class="col-lg-9">
                                <asp:Label runat="server" ID="lblusername"></asp:Label>
                            </div>
                        </div>
                        </div>
                        <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3">User Type :</label>
                            <div class="col-lg-9">
                                <asp:Label runat="server" ID="lblType"></asp:Label>
                            </div>
                        </div>
                            </div>
                        <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3">Address :</label>
                            <div class="col-lg-9">
                                <asp:Label runat="server" ID="lblAddress"></asp:Label>
                            </div>
                        </div>
                            </div>
                        <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3">City :</label>
                            <div class="col-lg-9">
                                <asp:Label runat="server" ID="lblCity"></asp:Label>
                            </div>
                        </div>
                            </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-lg-3">State :</label>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lblState"></asp:Label>
                                </div>
                            </div>
                         </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-lg-3">Country :</label>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lblCountry"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-lg-3">Phone :</label>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lblPhone"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-lg-3">Email :</label>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lblEmail"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <p style="margin-left:30%;margin-top:10%"><a href="Profile.aspx">
                        <asp:Image ID="image1" class="img-responsive" ImageUrl="~/Files/img/friends/fr-07.jpg" Width="150" runat="server" /></a></p>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2">
                            <asp:Button ID="btnAdd" OnClick="btnAdd_Click" class="btn btn-primary" Text="Edit" runat="server" /> 
                            <button id="btnCancel" class="btn btn-danger" onclick="index.aspx">Cancel</button>
                        </div>
                    </div><br /><br />
                </div>
               </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
</asp:Content>
