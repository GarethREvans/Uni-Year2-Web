<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="CO5027OnlineShop._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="css/DefaultPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="content_container">
        <div id="home_page_background_container">
            <%--Contains the main image for the page--%>
            <img id="home_page_background_TV" src="Images/Sony4KHDRTVBackground.jpe" alt="Sony 4K HDR TV" width="2000" height="700" /> <%--(Sony, c2017)--%>
            <%--(www.sony.co.uk, c2016)--%> <%--Main image for the page--%>
            <div id="browse_products_container">
                <div id="browse_products_information">
                    <%--Contains a little bit of information on what we sell--%>
                    <h1 id="browse_products_heading">TVs</h1>
                    <p id="browse_products_description">Browse our wide range of TVs, from low price HD TVs, to all new 4K HDR TVs.</p>
                    <div id="shop_now_all_products_container"><a id="shop_now_all_products_link" href="ProductsPage.aspx">Shop now</a></div>
                    <%--Links to the Products page--%>
                </div>
            </div>
        </div>
        <div id="products_filter_container">
            <h1 id="products_heading" class="productsHeading">The Future of TV - 4K</h1>
            <asp:Repeater ID="rptr_filter_products" runat="server">
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate><div class="productItemContainer">
                        <a class="productLink" href="<%# Eval("Id", "IndividualProductPage.aspx?Id={0}") %>">
                            <asp:Image CssClass="productImage" ImageUrl='<%# "~/Images/" + Eval("Id") + ".jpg" %>' runat="server" Width="500" Height="444" AlternateText='<%# Eval("AltText").ToString() %>' /><%--(pcworld, c2017)--%>
                            <p class="productDetails"><%# Eval("ProductName")%></p>
                            <p class="productDetails"><%# Eval("Price")%></p>
                        </a>
                    </div></ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
