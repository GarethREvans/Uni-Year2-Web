<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndividualProductPage.aspx.cs" Inherits="CO5027OnlineShop.IndividualProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="css/IndividualProductPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="content_container">
        <div id="product_container">
            <div id="product_image_container">
                <asp:Image ID="product_image" CssClass="productImage" Width="500px" Height="444px" runat="server" /><%--(pcworld, c2017)--%>
            </div>
            <div id="product_details_container">
                <asp:FormView ID="fv_product_info" runat="server" DataSourceID="productInfo">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <p id="product_name_p" class="productDetails"><%# Eval("ProductName") %></p>
                        <p id="price_p" class="productDetails"><%# Eval("Price") %></p>
                        <p id="product_information_p" class="productDetails"><%# "ProductInformation: " + Eval("ProductInformation") %></p>
                        <p id="screen_size_p" class="productDetails"><%# "Screen Size: " + Eval("ScreenSize") + '"' %></p>
                        <p id="resolution_p" class="productDetails"><%# "Resolution: " + Eval("Resolution") + "px" %></p>
                        <p id="energy_efficiency_class_p" class="productDetails"><%# "Energy Efficiency Class: " + Eval("EnergyEfficiencyClass") %></p>
                        <p id="smart_tv_p" class="productDetails"><%# "SmartTV: " + Eval("SmartTV") %></p>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:FormView>
            </div><div id="product_purchase_container">
                <asp:Panel ID="adding_basket_panel" runat="server">
                    <asp:Label ID="lbl_quantity" CssClass="productDetails" AssociatedControlID="txt_quantity" runat="server">Quantity: </asp:Label>
                    <asp:TextBox ID="txt_quantity" CssClass="productDetails" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_field_val_quantity" class="validatorElements" runat="server" ErrorMessage="Quantity is required" ValidationGroup="quantityValidation" ControlToValidate="txt_quantity" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regex_quantity" class="validatorElements" ControlToValidate="txt_quantity" ValidationExpression="^[0-9]{1,4}$" runat="server" ErrorMessage="Maximum of 4 integer characters allowed" ValidationGroup="quantityValidation" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RangeValidator ID="range_val_quantity" class="validatorElements" runat="server" ErrorMessage="Not enough stock or 0 products requested" Type="Integer" MinimumValue="1" MaximumValue="2" ControlToValidate="txt_quantity" ValidationGroup="quantityValidation" Display="Dynamic"></asp:RangeValidator>
                    <asp:Button ID="add_to_basket_button" CssClass="addToBasketButton" runat="server" Text="Add to Basket" ValidationGroup="quantityValidation" OnClick="add_to_basket_button_Click" />
                </asp:Panel>
                <div id="user_message_container">
                    <asp:Literal ID="login_message_lit" runat="server"></asp:Literal>
                </div>
            </div>
            <asp:SqlDataSource ID="productInfo" runat="server" ConnectionString="<%$ ConnectionStrings:co5027_database_ConnectionString %>" SelectCommand="SELECT [ProductName], [Price], [ProductInformation], [ScreenSize], [Resolution], [EnergyEfficiencyClass], [SmartTV] FROM [productsTable] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
