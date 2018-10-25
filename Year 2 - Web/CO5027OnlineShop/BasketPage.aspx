<%@ Page Title="Basket" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasketPage.aspx.cs" Inherits="CO5027OnlineShop.BasketPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="css/BasketPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="content_container">
        <div id="products_container">
            <h1 id="products_heading" class="productsHeading">Basket</h1>
            <asp:Literal ID="lit_message" runat="server"></asp:Literal>
            <asp:Panel ID="basket_panel" runat="server">
                <asp:Button ID="remove_button" CssClass="removeButton" runat="server" Text="Clear Basket" OnClick="remove_Click" />
                <asp:Repeater ID="rptr_products" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="productItemContainer">
                            <asp:Image CssClass="productImage" ImageUrl='<%# "~/Images/" + Eval("Id") + ".jpg" %>' runat="server" Width="500" Height="444" AlternateText='<%# Eval("AltText").ToString() %>' /><%--(pcworld, c2017)--%>
                            <p class="productDetails"><%# Eval("ProductName")%></p>
                            <p class="productDetails"><%# Eval("Price")%></p>
                            <p class="productDetails"><%# Eval("Quantity")%></p>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
