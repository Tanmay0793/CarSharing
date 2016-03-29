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
                    <div class="form-group">
                        <label class="col-lg-3" for="lblid">Admin ID :</label>
                        <div class="col-lg-3">
                            <asp:FileUpload ID="fileup" runat="server" />
                        </div>
                        <label class="col-lg-3 control-label" for="lblid">Admin Name :</label>
                        <div class="col-lg-3">
                            <label id="labelname" runat="server"></label>
                        </div>
                    </div><br /><br />
                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="txtname">Name :</label>
                        <div class="col-lg-9">
                            
                        </div>
                    </div><br /><br />
                     <div class="form-group">
                        <label class="col-lg-3 control-label" for="txtemail">Email :</label>
                        <div class="col-lg-9">
                            <asp:Label ID="lblemail" class="form-control" runat="server"></asp:Label>
                        </div>
                    </div><br /><br />
                    <div class="form-group">
                        <div class="col-lg-offset-2">
                          <!--  <button id="btnEdit" type="submit" onclick="return addarea()" class="btn btn-default">Save</button> !-->
                            <asp:Button ID="btnAdd" OnClick="btnAdd_Click" class="btn btn-default" Text="" runat="server" /> 
                            <button id="btnCancel" class="btn btn-danger" onclick="index.aspx">Cancel</button>

                        </div>
                    </div><br /><br />
                </div>

            </div>

        </div>
        
        <div class="col-lg-1"></div>
    </div>
    

</asp:Content>
