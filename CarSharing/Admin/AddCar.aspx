<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="AddCar.aspx.cs" Inherits="CarSharing.Admin.AddCar" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">

    <script type="text/javascript">

        function fun() {
            var cname = $('#<%= txtcarName.ClientID %>').val();
            var ctype = $("#cType option:selected").text();
            var cno = $('#<%= txtcarno.ClientID %>').val();
            var cregno = $('#<%= txtcarreg.ClientID %>').val();
            var cseats = $("#cSeats option:selected").text();
            var status = $('#checkActive').is(':checked');
            if (status == false) {
                status = "Inactive";
            }
            else {
                status = "Active";
            }
            PageMethods.setValue(cname, ctype.toString(), cno, cregno, cseats.toString(), status, onSucceed, onError);

            return false;
        }
        function onSucceed(result) {
            alert("Result :" + result);
        }
        function onError(error) {
            alert("Error: " + error.get_message());
        }

    </script>
    <br /><br />

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
                            <label class="col-lg-3 control-label" for="txtcarName">Car Name</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtcarName" class="form-control" placeholder="Enter Car Name.." runat="server"></asp:TextBox>
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="txtbrand">Brand Name</label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="drpbrand" class="form-control" OnSelectedIndexChanged="drpbrand_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>!
                            </div>
                        </div><br /><br />
                        <div class="form-group">
                           <label class="col-lg-3 control-label" for="select">Select Car Type</label>
                             <div class="col-lg-9">
                               <select id="cType" name="cartype" class="form-control">
                                  <option selected="selected">Sedan</option>
                                  <option>Van</option>
                                  <option>SUV</option>
                                  <option>Luxury Car</option>
                                  <option>HatchBack</option>
                               </select>
                             </div>
                        </div><br /><br />
                        <div class="form-group">
                           <label class="col-lg-3 control-label" for="txtcarno">Car No</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtcarno" class="form-control uniform-input" placeholder="Enter Car Number" runat="server"></asp:TextBox>
                           </div>
                       </div><br /><br />
                        <div class="form-group">
                           <label class="col-lg-3 control-label" for="txtcarreg">Car Registration No</label>
                           <div class="col-lg-9">
                               <asp:TextBox ID="txtcarreg" class="form-control uniform-input" placeholder="Enter RC Number" runat="server"></asp:TextBox>
                           </div>
                       </div><br /><br />
                        <div class="form-group">
                           <label class="col-lg-3 control-label" for="seats">Seat Availability</label>
                           <div class="col-lg-9">
                               <select id="cSeats" name="seats" class="form-control">
                                  <option selected="selected">ONE</option>
                                  <option>TWO</option>
                                  <option>THREE</option>
                                  <option>FOUR</option>
                                  <option>FIVE</option>
                               </select>
                           </div>
                       </div><br /><br />
                        <div class="form-group">
                            <label class="col-lg-3 control-label" for="chkstatus">Status</label>
                            <div class="col-lg-9">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="checkActive" value="Active" checked="checked" /> Active
                                    </label>
                            </div>
                        </div><br /><br />

                        <div class="form-group">
                            <div class="col-lg-offset-2">
                                <button id="btnSave" type="submit" onclick="return fun()" class="btn btn-default">Save</button>
                                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" class="btn btn-danger" Text="Cancel"/>
                            </div>
                        </div><br /><br />
                
                </div>

            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>


</asp:Content>
