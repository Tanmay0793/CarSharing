<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="ShowUsers.aspx.cs" Inherits="CarSharing.Admin.ShowUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainBody" runat="server">

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
        

    <div class="col-lg-12">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:GridView runat="server" ID="grid1" CssClass="grid1" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowEditing="grid1_RowEditing" OnRowCancelingEdit="grid1_RowCancelingEdit" OnRowUpdating="grid1_RowUpdating" OnRowDataBound="grid1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblid" Text='<%# Bind("id") %>' runat="server"></asp:Label>
                            </ItemTemplate>                           
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                           <ItemTemplate>
                                <asp:Label ID="lblname" Text='<%# Bind("name") %>' runat="server"></asp:Label>
                           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username">
                                <ItemTemplate>
                                    <asp:Label ID="lbluname" Text='<%# Bind("user_uname") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lbluname" Text='<%# Bind("email") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblemail"  Text='<%# Bind("status") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                <asp:DropDownList ID="ddlstatus" runat="server" Width="60">
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">InActive</asp:ListItem>
                                </asp:DropDownList> 
                            </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" class="btn btn-primary" CommandName="Edit" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-warning" CommandName="Update" />
                                    <asp:Button ID="btnCancel" runat="server" class="btn btn-danger" CommandName="Cancel" />
                                 </EditItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
