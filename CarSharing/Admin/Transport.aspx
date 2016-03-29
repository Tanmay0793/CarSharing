<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="Transport.aspx.cs" Inherits="CarSharing.Admin.Transport" %>
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
            <div class="col-md-8">
                <p style="font-size:larger;font-weight:bolder">Transport Company Details </p>
            </div>
            <div class="col-md-4">
                <asp:LinkButton ID="btnAdd" runat="server" class="btn btn-primary pull-right" OnClick="btnAdd_Click" >
                    <span class="icon16 icomoon-icon-car"></span>Add Company
                </asp:LinkButton>
            </div>
        </div><br /><br /> <br />

        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="uppanel" runat="server">
            <ContentTemplate>
                <asp:GridView ID="grid1" CssClass="grid1"  runat="server" OnRowEditing="grid1_RowEditing" OnRowCancelingEdit="grid1_RowCancelingEdit" OnRowUpdating="grid1_RowUpdating" AutoGenerateColumns="False" ForeColor="#333333" Width="100%" CellPadding="4" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lbltransid" Text='<%# Bind("trans_id") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblname" Text='<%# Bind("trans_name") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtname" Text='<%# Bind("trans_name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="true" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lbladd" Text='<%# Bind("trans_address") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtadd" TextMode="MultiLine" Text='<%# Bind("trans_address") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="true" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone No">
                            <ItemTemplate>
                                <asp:Label ID="lblphone" Text='<%# Bind("trans_phoneno") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtphone" Text='<%# Bind("trans_phoneno") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="true" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Person">
                            <ItemTemplate>
                                <asp:Label ID="lblper" Text='<%# Bind("trans_person") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtper" Text='<%# Bind("trans_person") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="true" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Person Number">
                            <ItemTemplate>
                                <asp:Label ID="lblpno" Text='<%# Bind("trans_personno") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtpno" Text='<%# Bind("trans_personno") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Font-Bold="true" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnedit" class="btn btn-primary" CommandName="Edit" Text="Edit" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" class="btn btn-warning" CommandName="Update" Text="Update" runat="server"></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnCancel" class="btn btn-danger" CommandName="Cancel" Text="Cancel" runat="server"></asp:LinkButton>
                            </EditItemTemplate>
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
