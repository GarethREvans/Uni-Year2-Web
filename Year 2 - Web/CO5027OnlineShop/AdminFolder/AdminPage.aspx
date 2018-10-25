<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="CO5027OnlineShop.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" runat="server" href="../css/AdminPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="content_container">
        <div id="administrator_container">
            <asp:Panel class="panelUsersFields" ID="panel_user_fields" runat="server">
                <h1 id="users_heading" class="adminHeading">Users</h1>
                <asp:GridView ID="grid_view_users" CssClass="gridViewUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="usersTable" DataKeyNames="Id" OnSelectedIndexChanged="users_selected_index" OnSelectedIndexChanging="users_selected_index_changing">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id">
                            <HeaderStyle CssClass="usersHeader" />
                            <ItemStyle CssClass="usersItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName">
                            <HeaderStyle CssClass="usersHeader" />
                            <ItemStyle CssClass="usersItem" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ShowSelectButton="True">
                            <HeaderStyle CssClass="usersHeader" />
                            <ItemStyle CssClass="usersItem" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:Panel ID="panel_user_display" runat="server">
                    <div id="users_role_container" class="usersRoleContainer">
                        <div class="fieldContainer">
                            <asp:Literal ID="userID_lit" runat="server"></asp:Literal>
                        </div>
                        <div class="fieldContainer">
                            <asp:Literal ID="user_role_lit" runat="server" ></asp:Literal>
                        </div>
                        <asp:Button ID="update_user_role_button" class="recordControlButton" runat="server" Text="Make Admin" UseSubmitBehavior="false" OnClick="update_user_role_button_Click" />
                    </div>
                </asp:Panel>
                <asp:SqlDataSource ID="usersTable" runat="server" ConnectionString="<%$ ConnectionStrings:co5027_database_ConnectionString %>" SelectCommand="SELECT [Id], [UserName] FROM [AspNetUsers]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @original_Id AND [UserName] = @original_UserName" InsertCommand="INSERT INTO [AspNetUsers] ([Id], [UserName]) VALUES (@Id, @UserName)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AspNetUsers] SET [UserName] = @UserName WHERE [Id] = @original_Id AND [UserName] = @original_UserName">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="String" />
                        <asp:Parameter Name="original_UserName" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="original_Id" Type="String" />
                        <asp:Parameter Name="original_UserName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <asp:Panel class="panelProductsFields" ID="panel_products_fields" runat="server">
                <h1 id="products_heading" class="adminHeading">Products</h1>
                <asp:GridView ID="grid_view_products" CssClass="gridViewProducts" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="productsTable" OnSelectedIndexChanged="products_selected_index" OnSelectedIndexChanging="products_selected_index_changing">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                            <ControlStyle CssClass="productsControlStyle" />
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id">
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price">
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ScreenSize" HeaderText="ScreenSize" SortExpression="ScreenSize">
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Resolution" HeaderText="Resolution" SortExpression="Resolution">
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock">
                            <HeaderStyle CssClass="productsHeader" />
                            <ItemStyle CssClass="productsItem" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <div class="litResponse">
                    <asp:Literal ID="lit_product_table_edit_response" runat="server" Text="Null"></asp:Literal>
                </div>
                <asp:Button ID="goto_add_product_record_button" class="gotoAddProductRecord" runat="server" Text="Add a New Product" UseSubmitBehavior="false" OnClick="goto_add_products_button_Click" />
                <asp:Panel class="panelProductsDisplayRecord" ID="panel_display_product" runat="server">
                    <div class="recordContainer">
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_id" runat="server"></asp:Literal>
                        </div>
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_name" runat="server" Text="Null"></asp:Literal>
                        </div>
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_price" runat="server" Text="Null"></asp:Literal>
                        </div>
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_screensize" runat="server" Text="Null"></asp:Literal>
                        </div>
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_resolution" runat="server" Text="Null"></asp:Literal>
                        </div>
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_stock" runat="server" Text="Null"></asp:Literal>
                        </div>
                        <asp:Button ID="goto_edit_product_record_button" class="recordControlButton" runat="server" Text="Edit the Product" UseSubmitBehavior="false" OnClick="goto_edit_products_button_Click" />
                        <asp:Button ID="delete_product_record_button" class="recordControlButton" runat="server" Text="Delete Product" UseSubmitBehavior="false" OnClick="delete_products_button_Click" />
                        <asp:Label ID="lab_alternate_text_edit" class="fieldContainer" AssociatedControlID="txt_alternate_text" runat="server">Alt Text:</asp:Label>
                        <asp:TextBox ID="txt_alternate_text" class="fieldContainer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="imageUpload" Display="Dynamic" class="validatorElements" ID="req_field_val_altText" runat="server" ControlToValidate="txt_alternate_text" ErrorMessage="Alternate Text is required"></asp:RequiredFieldValidator>
                        <asp:FileUpload ID="fu_product_image" runat="server" />
                        <asp:RequiredFieldValidator ValidationGroup="imageUpload" Display="Dynamic" class="validatorElements" ID="req_field_val_fileUpload" runat="server" ControlToValidate="fu_product_image" ErrorMessage="Image Upload is required"></asp:RequiredFieldValidator>
                        <div class="validatorElements">
                            <asp:Literal ID="image_val" runat="server" Text="Null"></asp:Literal>
                        </div>
                        <asp:Button ValidationGroup="imageUpload" ID="upload_image_button" class="recordControlButton" runat="server" Text="Set Product Image " UseSubmitBehavior="false" OnClick="upload_image_button_Click" />
                        <asp:Image ID="product_image" Class="productImage" runat="server" Width="500px" Height="444px" AlternateText="product_Image" />
                        <%--(pcworld, c2017)--%>
                    </div>
                </asp:Panel>
                <asp:Panel class="panelProductsDisplayRecord" ID="panel_input_product" runat="server">
                    <div class="recordContainer">
                        <div class="fieldContainer">
                            <asp:Literal ID="lit_product_ID_edit" runat="server"></asp:Literal>
                        </div>
                        <asp:Label ID="lab_product_name_edit" CssClass="fieldContainer" AssociatedControlID="txt_product_name" runat="server">Name:</asp:Label>
                        <asp:TextBox ID="txt_product_name" class="fieldContainer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="req_field_val_product_name" runat="server" ControlToValidate="txt_product_name" ErrorMessage="Product Name is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="regex_product_name" ControlToValidate="txt_product_name" ValidationExpression="^.{0,100}$" runat="server" ErrorMessage="Maximum of 100 characters allowed"></asp:RegularExpressionValidator>

                        <asp:Label ID="lab_product_price_edit" CssClass="fieldContainer" AssociatedControlID="txt_product_price" runat="server">Price:</asp:Label>
                        <asp:TextBox ID="txt_product_price" class="fieldContainer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="req_field_val_price" runat="server" ControlToValidate="txt_product_price" ErrorMessage="Product Price is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="regex_price_length" ControlToValidate="txt_product_price" ValidationExpression="^.{0,8}$" runat="server" ErrorMessage="Maximum of 8 characters allowed"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="regex_price_format" ControlToValidate="txt_product_price" ValidationExpression="^[1-9][0-9]{0,4}(\.[0-9]{2})$" runat="server" ErrorMessage="Must be in format ...00.00"></asp:RegularExpressionValidator>

                        <asp:Label ID="lab_product_information_edit" CssClass="fieldContainer" AssociatedControlID="txt_product_information" runat="server">Information:</asp:Label>
                        <asp:TextBox ID="txt_product_information" class="fieldContainer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="req_field_val_information" runat="server" ControlToValidate="txt_product_information" ErrorMessage="Product Information is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="regex_product_information" ControlToValidate="txt_product_information" ValidationExpression="^.{0,200}$" runat="server" ErrorMessage="Maximum of 200 characters allowed"></asp:RegularExpressionValidator>


                        <asp:Label ID="lab_product_screensize_edit" CssClass="fieldContainer" AssociatedControlID="txt_product_screensize" runat="server">Screen Size:</asp:Label>
                        <asp:TextBox ID="txt_product_screensize" class="fieldContainer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="req_field_val_screesize" runat="server" ControlToValidate="txt_product_screensize" ErrorMessage="Product Screen Size is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="regex_information" ControlToValidate="txt_product_screensize" ValidationExpression="^[0-9]{1,4}$" runat="server" ErrorMessage="Maximum of 4 integer characters allowed"></asp:RegularExpressionValidator>

                        <asp:Label ID="lab_product_resolution_edit" CssClass="fieldContainer" AssociatedControlID="ddl_product_resolution" runat="server">Resolution:</asp:Label>
                        <asp:DropDownList ID="ddl_product_resolution" class="fieldContainer" runat="server"></asp:DropDownList>
                        <asp:Label ID="lab_product_energyefficiencyclass_edit" CssClass="fieldContainer" AssociatedControlID="ddl_product_energyefficiencyclass" runat="server">Energy Class:</asp:Label>
                        <asp:DropDownList ID="ddl_product_energyefficiencyclass" class="fieldContainer" runat="server"></asp:DropDownList>
                        <asp:Label ID="lab_product_smarttv_edit" CssClass="fieldContainer" AssociatedControlID="ddl_product_smarttv" runat="server">Smart TV:</asp:Label>
                        <asp:DropDownList ID="ddl_product_smarttv" class="fieldContainer" runat="server"></asp:DropDownList>

                        <asp:Label ID="lab_product_stock_edit" CssClass="fieldContainer" AssociatedControlID="txt_product_stock" runat="server">Stock:</asp:Label>
                        <asp:TextBox ID="txt_product_stock" class="fieldContainer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="req_field_val_stock" runat="server" ControlToValidate="txt_product_stock" ErrorMessage="Product Stock is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="productInformation" Display="Dynamic" class="validatorElements" ID="regex_stock" ControlToValidate="txt_product_stock" ValidationExpression="^[1-9][0-9]{1,4}$" runat="server" ErrorMessage="Maximum of 4 integer characters allowed"></asp:RegularExpressionValidator>

                        <asp:Button ValidationGroup="productInformation" ID="edit_product_record_button" class="recordControlButton" runat="server" Text="Edit Product" UseSubmitBehavior="false" OnClick="edit_products_button_Click" />
                        <asp:Button ValidationGroup="productInformation" ID="add_product_record_button" class="recordControlButton" runat="server" Text="Add Product" UseSubmitBehavior="false" OnClick="add_products_button_Click" />
                    </div>
                </asp:Panel>
                <asp:SqlDataSource ID="productsTable" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:co5027_database_ConnectionString %>" DeleteCommand="DELETE FROM [productsTable] WHERE [Id] = @original_Id AND [ProductName] = @original_ProductName AND [Price] = @original_Price AND [ScreenSize] = @original_ScreenSize AND [Resolution] = @original_Resolution AND (([Stock] = @original_Stock) OR ([Stock] IS NULL AND @original_Stock IS NULL))" InsertCommand="INSERT INTO [productsTable] ([ProductName], [Price], [ScreenSize], [Resolution], [Stock]) VALUES (@ProductName, @Price, @ScreenSize, @Resolution, @Stock)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [ProductName], [Price], [ScreenSize], [Resolution], [Stock] FROM [productsTable]" UpdateCommand="UPDATE [productsTable] SET [ProductName] = @ProductName, [Price] = @Price, [ScreenSize] = @ScreenSize, [Resolution] = @Resolution, [Stock] = @Stock WHERE [Id] = @original_Id AND [ProductName] = @original_ProductName AND [Price] = @original_Price AND [ScreenSize] = @original_ScreenSize AND [Resolution] = @original_Resolution AND (([Stock] = @original_Stock) OR ([Stock] IS NULL AND @original_Stock IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_ProductName" Type="String" />
                        <asp:Parameter Name="original_Price" Type="String" />
                        <asp:Parameter Name="original_ScreenSize" Type="String" />
                        <asp:Parameter Name="original_Resolution" Type="String" />
                        <asp:Parameter Name="original_Stock" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Price" Type="String" />
                        <asp:Parameter Name="ScreenSize" Type="String" />
                        <asp:Parameter Name="Resolution" Type="String" />
                        <asp:Parameter Name="Stock" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Price" Type="String" />
                        <asp:Parameter Name="ScreenSize" Type="String" />
                        <asp:Parameter Name="Resolution" Type="String" />
                        <asp:Parameter Name="Stock" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_ProductName" Type="String" />
                        <asp:Parameter Name="original_Price" Type="String" />
                        <asp:Parameter Name="original_ScreenSize" Type="String" />
                        <asp:Parameter Name="original_Resolution" Type="String" />
                        <asp:Parameter Name="original_Stock" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
