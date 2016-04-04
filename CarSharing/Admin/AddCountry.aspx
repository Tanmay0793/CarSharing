<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="AddCountry.aspx.cs" Inherits="CarSharing.Admin.AddCountry" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <script type="text/javascript">

        function addcountry() {
            var name = $('#<%= txtState.ClientID %>').val();
            var status = $('#checkActive').val();
            if (status != "Active") {
                status = "Inactive";
            }

            PageMethods.setValue(name, status, onSucceed, onError);

            return false;

        }
        function onSucceed(result) {
            alert("Result :" + result);
        }
        function onError(error) {
            alert("Error: " + error.get_message());
        }
        function funtrans() {
            window.location = '<%= ResolveUrl("index.aspx") %>'
              return false;
          }

    </script>

    <div class="row">
        
        <div class="col-lg-2"></div>   
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>
                        <span>Add State</span>
                    </h4>
                </div>
                <div class="panel-body">
                   <asp:ScriptManager ID="scriptmgr" EnablePageMethods="true" runat="server"></asp:ScriptManager>
                      <asp:UpdatePanel ID="update" runat="server">
                        <ContentTemplate>    

                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtState">Country Name:</label>
                            <div class="col-lg-9">
                                <input type="text" id="txtState" class="form-control" runat="server" placeholder="State Name..." />
                            </div>
                        </div><br /><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="chkstatus">Country Status:</label>
                            <div class="col-lg-9">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="checkActive" value="Active" checked="checked" />
                                    Active
                                </label>
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                            <div class="col-lg-offset-2">
                                <button id="btnSave" type="submit" onclick="return addcountry()" class="btn btn-default">Save</button>
                                <button id="btnCancel" runat="server" onclick="return funtrans()" class="btn btn-danger">Cancel</button>

                            </div>
                        </div>
                      </ContentTemplate>
                  </asp:UpdatePanel>

                </div>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>



</asp:Content>
