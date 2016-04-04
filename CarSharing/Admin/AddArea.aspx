<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="AddArea.aspx.cs" Inherits="CarSharing.Admin.AddArea" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <script type="text/javascript">

        function addarea() {
            var name = $('#<%= txtArea.ClientID %>').val();
              var pin = $('#<%= txtpin.ClientID %>').val();
              var status = $('#checkActive').val();
              if (status != "Active") {
                  status = "Inactive";
              }

              PageMethods.setValue(name, status, pin, onSucceed, onError);

              return false;

          }
          function onSucceed(result) {
              window.location='<%= ResolveUrl("index.aspx") %>';
          }
          function onError(error) {
              alert("Error: " + error.get_message() + error.get_LineNo());
          }
          function funtrans() {
              window.location = '<%= ResolveUrl("index.aspx") %>'
            return false;
        }
       </script>
    <asp:ScriptManager ID="scriptmgr" EnablePageMethods="true" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>
                        <span>Add Area</span>
                    </h4>
                </div>
                <div class="panel-body">
               <asp:UpdatePanel ID="update" runat="server">
                <ContentTemplate>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="drpcountry">Select Country:</label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="drpcountry" class="form-control" OnSelectedIndexChanged="drpcountry_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div><br /><br /><br />
                    
                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="drpstate">Select State:</label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="drpstate" class="form-control" OnSelectedIndexChanged="drpstate_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div><br /><br />

                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="drpstate">Select City:</label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="drpCity" class="form-control" OnSelectedIndexChanged="drpCity_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div><br /><br />

                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="txtArea">Area Name:</label>
                        <div class="col-lg-9">
                            <input type="text" id="txtArea" class="form-control" runat="server" placeholder="Area Name..." />
                        </div>
                    </div><br /><br />

                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="txtpin">Area Pincode:</label>
                        <div class="col-lg-9">
                            <input type="text" id="txtpin" class="form-control" runat="server" placeholder="Area Pincode..." />
                        </div>
                    </div><br /><br />


                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="chkstatus">Area Status:</label>
                        <div class="col-lg-9">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="checkActive" value="Active" checked="checked" />
                                Active
                            </label>
                        </div>
                    </div><br /><br />

                    <div class="form-group">
                        <div class="col-lg-offset-2">
                            <button id="btnSave" type="submit" onclick="return addarea()" class="btn btn-default">Save</button>
                            <button id="btnCancel" class="btn btn-danger" onclick="return funtrans()">Cancel</button>

                        </div>
                    </div><br /><br />
                  </ContentTemplate>
                 </asp:UpdatePanel>

                </div>
            </div>
        </div>
        <div class="col-lg-2"></div>

    </div>
    

</asp:Content>
