<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="AddTransport.aspx.cs" Inherits="CarSharing.Admin.AddTransport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <script type="text/javascript">

        function myfun() {
            var name = $('#<%= txtname.ClientID %>').val();
            var address = $('#<%= txtadd.ClientID %>').val();
            var phone = $('#<%= txtphone.ClientID %>').val();
            var pname = $('#<%= txtpersonname.ClientID %>').val();
            var pno = $('#<%= txtpersonphone.ClientID %>').val();

            PageMethods.setValue(name, address, phone, pname, pno, onSucceed, onError);
            return false;
        }

        function onSucceed(res) {
            if (res == "success") {
                alert("Data Inserted Successfully...");
            }
            else {
                alert("Error in Inserting......");
            }
        }

        function onError(res) {
            alert("Error is : " + res.get_message());
        }

        function funtrans() {
            window.location = '<%= ResolveUrl("Transport.aspx") %>'
            return false;
        }
    </script>

    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4> 
                       <span>Add New Car</span>
                    </h4>
                </div>
                <div class="panel-body">
                    
                        <asp:ScriptManager ID="scriptmgr" EnablePageMethods="true" runat="server"></asp:ScriptManager>
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtname">Transport Name:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtname" class="form-control" placeholder="Transport Name.." runat="server"></asp:TextBox>
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtadd">Transport Address:</label>
                               <div class="col-lg-9">
                                  <asp:TextBox ID="txtadd" TextMode="MultiLine" class="form-control" placeholder="Transport address.." runat="server"></asp:TextBox>
                               </div>
                        </div><br /><br /><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtphone">Phone No:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtphone" class="form-control" placeholder="Phone No.." runat="server"></asp:TextBox>
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtperson">Contact Person Name:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtpersonname" class="form-control" placeholder="Contact Person Name.." runat="server"></asp:TextBox>
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtpersonphone">Contact Person Phone:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtpersonphone" class="form-control" placeholder="Contact Person Phone.." runat="server"></asp:TextBox>
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                            <div class="col-lg-offset-2">
                                <button id="btnSave" type="submit" onclick="return myfun()" class="btn btn-default">Save</button>
                                <button id="btnCancel" type="submit" runat="server" onclick="return funtrans()" class="btn btn-danger">Cancel</button>
                            </div>
                        </div>
                    
                </div>
            </div>
        </div>
        <div class="col-lg-2">
        </div>
   </div>


</asp:Content>
