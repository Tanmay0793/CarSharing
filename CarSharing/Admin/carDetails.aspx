<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="carDetails.aspx.cs" Inherits="CarSharing.Admin.carDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <style>
        .grid1 td, .grid1 th
        {
            text-align:center;
        }
    </style>
        
      <div class="row">
            <div class="col-lg-12"><br /><br /></div>
        </div>

        <div class="row">
             <div class="col-lg-8">
                <p style="font-size:larger;font-weight:bolder">Car Details </p>
            </div>
            <div class="col-lg-4">
                <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-primary pull-right" OnClick="btnAdd_Click">
                    <span class="icon16 icomoon-icon-car"></span>Add New Car
                </asp:LinkButton>
            </div>
        </div>    
        <br /><br /> <br />
        
            <asp:ScriptManager ID="scriptmgr" runat="server" ></asp:ScriptManager>
            <asp:UpdatePanel ID="update" runat="server">
            <ContentTemplate>
                <asp:GridView ID="grid1" runat="server" CssClass="grid1" Width="100%" OnRowDataBound="grid1_RowDataBound"
                    OnRowEditing="grid1_RowEditing" OnRowCancelingEdit="grid1_RowCancelingEdit"
                    OnRowUpdating="grid1_RowUpdating"
                    AutoGenerateColumns="False" ForeColor="#333333" CellPadding="4" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Car ID">
                            <ItemTemplate>
                                <asp:Label ID="lblcid" Text='<%# Bind("car_id") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Car Name">
                            <ItemTemplate>
                                <asp:Label ID="lblcname" Text='<%# Bind("car_name") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtcname" Width="120" Text='<%# Bind("car_name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Car Brand">
                            <ItemTemplate>
                                <asp:Label ID="lbcbrand" Text='<%# Bind("car_brand") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtcbrand" Width="120" Text='<%# Bind("car_brand") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Car Type">
                            <ItemTemplate>
                                <asp:Label ID="lblctype" Text='<%# Bind("car_type") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Bind("car_type")%>' Visible = "false"></asp:Label>
                                <asp:DropDownList ID="cType" runat="server" Width="70">
                                    <asp:ListItem Value="Sedan">Sedan</asp:ListItem>
                                    <asp:ListItem Value="Van">Van</asp:ListItem>
                                    <asp:ListItem Value="SUV">SUV</asp:ListItem>
                                    <asp:ListItem Value="Luxury Car">Luxury Car</asp:ListItem>
                                    <asp:ListItem Value="Hatchback">Hatchback</asp:ListItem>
                                </asp:DropDownList> 
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Car Number">
                            <ItemTemplate>
                                <asp:Label ID="lblcno" Text='<%# Bind("car_no") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Car Reg.No">
                            <ItemTemplate>
                                <asp:Label ID="lblregno" Text='<%# Bind("car_regNo") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtregno" Width="120" Text='<%# Bind("car_regNo") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Added">
                            <ItemTemplate>
                                <asp:Label ID="lbldate" Text='<%# Bind("DOB") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seat Available">
                            <ItemTemplate>
                                <asp:Label ID="lblseat" Text='<%# Bind("car_seat") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="cSeats" runat="server" Width="60">
                                    <asp:ListItem Value="One">One</asp:ListItem>
                                    <asp:ListItem Value="Two">Two</asp:ListItem>
                                    <asp:ListItem Value="Three">Three</asp:ListItem>
                                    <asp:ListItem Value="Four">Four</asp:ListItem>
                                    <asp:ListItem Value="Five">Five</asp:ListItem>
                                </asp:DropDownList> 
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblstatus" ForeColor="Red" Font-Bold="true" Text='<%# Bind("car_status") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="cstatus" runat="server" Width="70">
                                    <asp:ListItem Value="Active">Active</asp:ListItem>
                                    <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField> 
                            <ItemTemplate>
                                <asp:LinkButton ID="btnedit" class="btn btn-primary" CommandName="Edit" Text="Edit" OnClientClick="return Validate(this)" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" Text="Update" class="btn btn-warning" CommandName="Update"  runat="server" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="btnCancel" Text="Cancel" class="btn btn-danger" CommandName="Cancel" runat="server" />
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>   
           </ContentTemplate>
          </asp:UpdatePanel>


</asp:Content>
