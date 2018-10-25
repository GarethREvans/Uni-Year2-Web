<%@ Page Title="Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterLoginPage.aspx.cs" Inherits="CO5027OnlineShop.RegisterLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="css/RegisterLoginPage.css" />
    <%--Links to stylesheet for this web form--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <div id="content_container">
        <%--Contains account content--%>
        <div id="account_container">

            <div class="accountTab" id="login_tab" onclick="login_tab_Click()">
                Login
                <asp:Button class="btnAccountTab1" ID="btn_login_tab" runat="server" ValidationGroup="none" Text="Login" OnClick="login_tab_Click_" UseSubmitBehavior="false"></asp:Button>
            </div><div class="accountTab" id="register_tab" onclick="register_tab_Click()">
                Sign-up
                <asp:Button class="btnAccountTab2" ID="btn_register_tab" runat="server" ValidationGroup="none" Text="Sign-up" OnClick="register_tab_Click_" UseSubmitBehavior="false"></asp:Button>
            </div>

            <%-- Panel contains login form--%>
            <asp:Panel class="panelAccountForm" ID="panel_login_fields" runat="server" ClientIDMode="Static">
                <div class="literalStyle">
                    <asp:Literal ID="literal_account_message_login" runat="server" Text=""></asp:Literal>
                </div>
                <%--Heading for the login section--%>
                <h1 id="login_heading">Login</h1>

                <%--Relevant label and input elements for a login form--%>

                <asp:Label class="formLabel" ID="login_email_label" runat="server" AssociatedControlID="login_email_input">Email Address:</asp:Label>
                <asp:TextBox class="formInput" ID="login_email_input" runat="server" placeholder="Type Here"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_login_email" runat="server" ControlToValidate="login_email_input" ErrorMessage="E-mail address is required" ValidationGroup="val_login_fields"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_login_email" ControlToValidate="login_email_input" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" runat="server" ErrorMessage="Not a valid Email address format" ValidationGroup="val_login_fields"></asp:RegularExpressionValidator>

                <asp:Label class="formLabel" ID="login_password_label" runat="server" AssociatedControlID="login_password_input">Password:</asp:Label>
                <asp:TextBox class="formInput" ID="login_password_input" runat="server" placeholder="Type Here" TextMode="Password"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_login_password" runat="server" ControlToValidate="login_password_input" ErrorMessage="Password is required" ValidationGroup="val_login_fields"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_login_password" ControlToValidate="login_password_input" ValidationExpression="^.{0,70}$" runat="server" ErrorMessage="Maximum of 70 characters allowed" ValidationGroup="val_login_fields"></asp:RegularExpressionValidator>

                <%-- Button submits the form and calls the relevant c# routine when clicked to authenticate the user--%>
                <asp:Button class="submitDetails" id="submitLogin" runat="server" Text="Login" OnClick="login_Click" ValidationGroup="val_login_fields" UseSubmitBehavior="false"></asp:Button><%--Authenticates user--%>
            </asp:Panel>

            <%-- Panel contains registration form --%>
            <asp:Panel class="panelAccountForm" ID="panel_register_fields" runat="server" ClientIDMode="Static">

                <%--Heading for the register section--%>
                <h1 id="register_heading">Sign-up</h1>

                <div class="literalStyle">
                    <asp:Literal ID="literal_account_message_register" runat="server" Text=""></asp:Literal>
                </div>
                
                <asp:Label class="formLabel" ID="register_email_label" runat="server" AssociatedControlID="register_email_input">Email Address:</asp:Label>
                <asp:TextBox class="formInput" ID="register_email_input" runat="server" placeholder="Type Here"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_register_email" runat="server" ControlToValidate="register_email_input" ErrorMessage="E-mail address is required" ValidationGroup="val_register_fields"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_register_email" ControlToValidate="register_email_input" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" runat="server" ErrorMessage="Not a valid Email address format" ValidationGroup="val_register_fields"></asp:RegularExpressionValidator>

                <asp:Label class="formLabel" ID="register_password_label" runat="server" AssociatedControlID="register_password_input">Password:</asp:Label>
                <asp:TextBox class="formInput" ID="register_password_input" runat="server" placeholder="Type Here" TextMode="Password"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_register_password" runat="server" ControlToValidate="register_password_input" ErrorMessage="Password is required" ValidationGroup="val_register_fields"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_register_password" ControlToValidate="register_password_input" ValidationExpression="^.{0,70}$" runat="server" ErrorMessage="Maximum of 70 characters allowed" ValidationGroup="val_register_fields"></asp:RegularExpressionValidator>

                <asp:Label class="formLabel" ID="register_cpassword_label" runat="server" AssociatedControlID="register_cpassword_input">Confirm Password:</asp:Label>
                <asp:TextBox class="formInput" ID="register_cpassword_input" runat="server" placeholder="Type Here" TextMode="Password"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_register_cpassword" runat="server" ControlToValidate="register_cpassword_input" ErrorMessage="Confirm Password is required" ValidationGroup="val_register_fields"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_register_cpassword" ControlToValidate="register_cpassword_input" ValidationExpression="^.{0,70}$" runat="server" ErrorMessage="Maximum of 70 characters allowed" ValidationGroup="val_register_fields"></asp:RegularExpressionValidator>
                <asp:CompareValidator class="validatorElements" ID="compare_val_register_password" ControlToValidate="register_password_input" Operator="Equal" ControlToCompare="register_cpassword_input" runat="server" ErrorMessage="The password's you have entered do not match" ValidationGroup="val_register_fields"></asp:CompareValidator>

                <%-- Button submits the form and calls the relevant c# routine when clicked to register the user--%>
                <asp:Button class="submitDetails" id="submitRegister" runat="server" Text="Register" OnClick="register_Click" ValidationGroup="val_register_fields" UseSubmitBehavior="false"></asp:Button><%--Register user--%>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript" src="JavaScript/RegisterLoginPage.js"></script>

</asp:Content>
