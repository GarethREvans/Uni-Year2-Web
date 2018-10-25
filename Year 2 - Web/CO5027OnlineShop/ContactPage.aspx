<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="CO5027OnlineShop.ContactPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="css/ContactPage.css" />
    <%--Links to stylesheet for this web form--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="content_container">
        <%--Contains Form and map content--%>
        <div id="contact_us_container">
            <%-- Panel contains Form content--%>
            <asp:Panel class="panelConactForm" ID="panel_contact_fields" runat="server">
                <%--Heading for the Email sending section--%>
                <h1 id="contact_us_heading">Contact Us</h1>

                <%--Relevant label and input elements for a contact form--%>
                <asp:Label class="formLabel" ID="name_label" runat="server" AssociatedControlID="name_input">Name:</asp:Label>
                <asp:TextBox class="formInput" ID="name_input" runat="server" placeholder="Type Here"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_name" runat="server" ControlToValidate="name_input" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_name" ControlToValidate="name_input" ValidationExpression="^.{0,200}$" runat="server" ErrorMessage="Maximum of 200 characters allowed"></asp:RegularExpressionValidator>

                <asp:Label class="formLabel" ID="email_label" runat="server" AssociatedControlID="email_input">Email Address:</asp:Label>
                <asp:TextBox class="formInput" ID="email_input" runat="server" placeholder="Type Here"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_email" runat="server" ControlToValidate="email_input" ErrorMessage="E-mail address is required"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_email" ControlToValidate="email_input" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" runat="server" ErrorMessage="Not a valid Email address format"></asp:RegularExpressionValidator>

                <asp:Label class="formLabel" ID="subject_label" runat="server" AssociatedControlID="subject_input">Subject:</asp:Label>
                <asp:TextBox class="formInput" ID="subject_input" runat="server" placeholder="Type Here"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_subject" runat="server" ControlToValidate="subject_input" ErrorMessage="Subject is required"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_subject" ControlToValidate="subject_input" ValidationExpression="^.{0,70}$" runat="server" ErrorMessage="Maximum of 70 characters allowed"></asp:RegularExpressionValidator>

                <asp:Label class="formLabel" ID="message_label" runat="server" AssociatedControlID="message_textarea">Your Message:</asp:Label>
                <asp:TextBox class="formInput" ID="message_textarea" runat="server" placeholder="Type Here"></asp:TextBox>
                <%-- Required field validator to ensure the above text field has been filled in on the form --%>
                <asp:RequiredFieldValidator Display="Dynamic" class="validatorElements" ID="req_field_val_message" runat="server" ControlToValidate="message_textarea" ErrorMessage="Message is required"></asp:RequiredFieldValidator>
                <%-- Regex validation to check character length of above text field --%>
                <asp:RegularExpressionValidator Display="Dynamic" class="validatorElements" ID="regex_message" ControlToValidate="message_textarea" ValidationExpression="^.{0,500}$" runat="server" ErrorMessage="Maximum of 500 characters allowed"></asp:RegularExpressionValidator>

                <%-- Button submits the form and calls the relevant c# routine when clicked --%>
                <asp:Button class="submitMessage" runat="server" Text="Submit" OnClick="submitMessage_Click" UseSubmitBehavior="false"></asp:Button><%--Sends data to store E-mail address--%>
            </asp:Panel>
            <asp:Panel class="panelConactForm" ID="panel_email_response" runat="server">
                <div class="responseText">
                    <asp:Literal ID="response_text_top" runat="server" Text=""></asp:Literal>
                </div>
                <div class="responseText">
                    <asp:Literal ID="response_text_bottom" runat="server" Text=""></asp:Literal>
                </div>
            </asp:Panel>

            <%--Heading for the map section--%>
            <h1 id="find_us_heading">Find Us</h1>

            <%--Contains the map system and the alternate static map--%>
            <div id="map_content_container">
                <%--Contains static map of store location incase JavaScript is turned off--%>
                <img class="staticMap" id="static_map" alt="Shop Address: Ince Ln, City Centre, Elton, Chester, CH2 4LU, UK" src="https://maps.googleapis.com/maps/api/staticmap?center=53.272792,-2.812533&zoom=15&size=600x300&format:jpg-baseline&scale:2&maptype=roadmap&markers=color:red%7Clabel:%7C53.272792,-2.812533&key=AIzaSyCHPOBSD3mheabUSqnjC0eiEHvK8D42jtM" />
                <div id="store_location_google_maps">
                </div>
            </div>

        </div>
    </div>
    <%--Reference to relevant JavaScript files--%>
    <script type="text/javascript" src="JavaScript/ContactPage.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB06NM206EHjtTcihdoYyZLdn-DPnjFwuY&callback=initMap"></script>
</asp:Content>
