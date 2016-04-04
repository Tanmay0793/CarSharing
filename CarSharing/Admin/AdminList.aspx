<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="AdminList.aspx.cs" Inherits="CarSharing.Admin.AdminList" %>

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
            <h3><span class="pull-left">Admin</span></h3>
        </div>
        <div class="col-lg-4">
            <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-primary  pull-right" OnClick="btnAdd_Click">
                    <span class="icon16 icomoon-icon-car"></span>Add New Admin
            </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
       
    </div>
    <br /><br />
    <div class="row">
        <div class="col-lg-12">

            <asp:ScriptManager ID="scriptmgr" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                   <asp:GridView ID="grid1" runat="server" CssClass="grid1" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" OnSelectedIndexChanged="grid1_SelectedIndexChanged" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="Admin ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" Text='<%# Bind("id") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Admin Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblname" Text='<%# Bind("name") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Username">
                                <ItemTemplate>
                                    <asp:Label ID="lbluname" Text='<%# Bind("user_uname") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Admin Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblemail"  Text='<%# Bind("status") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ControlStyle-ForeColor="Blue" ControlStyle-Font-Underline="true" ShowSelectButton="True" >
                            <ControlStyle Font-Underline="True" ForeColor="Blue" />
                            </asp:CommandField>
                           
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
    </div>


</asp:Content>
