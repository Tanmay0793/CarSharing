<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="AdminAdd.aspx.cs" Inherits="CarSharing.Admin.AdminAdd" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <script type="text/javascript">

        function funtrans() {
            window.location = '<%= ResolveUrl("index.aspx") %>'
           return false;
       }

    </script>


   

    <div class="row">
            <div class="col-lg-12"><br /><br /></div>
        </div>    
   <asp:ScriptManager ID ="sc" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel>
        <ContentTemplate>

        
    <div class="row">
        
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <div class="panel panel-default form-horizontal">
                <div class="panel-heading">
                    <h4>
                        <span>Admin</span>
                    </h4>
                </div>
                <div class="panel-body dl-horizontal">
                   <!-- <div class="form-group">
                        <div class="col-lg-9">
                        </div>
                        <div class="col-lg-3">
                            <asp:Image ID="image1" runat="server" class="" ImageUrl="~/Files/img/friends/fr-01.jpg" Width="150" Height="120" />
                            <asp:FileUpload ID="fileup" class="pull-right" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2">

                            <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-primary" Text="" OnClick="btnAdd_Click"></asp:LinkButton>
                            <button id="btnCancel" runat="server" class="btn btn-danger" onclick="return funtrans()">Cancel</button>
                        </div>
                    </div>
                    </br> !-->
                    
                    <asp:Image ID="image3" runat="server" Width="150" Height="120" />
                    <asp:FileUpload ID="fileup1" class="pull-right" runat="server" />
                    <asp:Button ID="btnAdd1" runat="server" class="btn btn-primary" Text="Save" OnClick="btnAdd1_Click" />

                </div>
        </div>
       </div>
        <div class="col-lg-1"></div>

    </div>
   </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>
