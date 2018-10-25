<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="CO5027OnlineShop.ProductsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="css/ProductsPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="content_container">
        <div id="products_container">
            <h1 id="products_heading" class="productsHeading">Products</h1>
            <asp:Repeater ID="rptr_products" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate><div class="productItemContainer">
                        <a class="productLink" href="<%# Eval("Id", "IndividualProductPage.aspx?Id={0}") %>">
                            <asp:Image CssClass="productImage" ImageURL='<%# "~/Images/" + Eval("Id") + ".jpg" %>' runat="server" Width="500" Height="444" AlternateText='<%# Eval("AltText").ToString() %>' /><%--(pcworld, c2017)--%>
                            <p class="productDetails"><%# Eval("ProductName")%></p>
                            <p class="productDetails"><%# Eval("Price")%></p>
                        </a>
                    </div></ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
