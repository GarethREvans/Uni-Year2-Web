using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CO5027OnlineShop
{
    public partial class ContactPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panel_contact_fields.Style["visibility"] = "visible"; /*Sets some states and properties of some elements on the page*/
            panel_email_response.Style["visibility"] = "hidden";

        }





        protected void submitMessage_Click(object sender, EventArgs e)
        {

            Page.Validate();    /*Validates page*/
            if (Page.IsValid == true) /*Checks if page is valid*/
            {

                SmtpClient smtpClient = new SmtpClient(); /*Set up an SMTP Client a set its properties*/
                //to authenticate we set the username and password properites on the SmtpClient
                smtpClient.UseDefaultCredentials = false;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(/*valid gmail address*/"", /*corresponding password for that email address*/"");
                smtpClient.Credentials = credentials;
                //Send the message
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;



                MailMessage msg = new MailMessage(); /*Set up a Mail Message and set its properties*/
                //Set the adresses
                msg.From = new MailAddress(email_input.Text);
                msg.To.Add(/*valid gmail being used to send emails to address*/"");
                //Set the content
                msg.Subject = subject_input.Text;
                msg.IsBodyHtml = true;
                msg.Body = message_textarea.Text + "<br/><br/>from<br/>" + name_input.Text + "<br/>" + msg.From;

                panel_contact_fields.Style["visibility"] = "hidden"; /*Sets some states and properties of the panel elements*/
                panel_contact_fields.Style["height"] = "0px;";
                panel_email_response.Style["visibility"] = "visible";
                try { /*Try to send the email and set an appropriate response in the label elements if successful*/
                    smtpClient.Send(msg);
                    response_text_top.Text = "Thank you!";
                    response_text_bottom.Text = "We will process your E-mail as soon as we can.";
                }
                catch (Exception) { /*If sending is unsuccessful, set an appropriate response message for the user to read in the label elements*/
                    response_text_top.Text = "Oops!";
                    response_text_bottom.Text = "Sorry, your E-mail has failed to send. Please try again later.";
                }
            } else
            {

            }
        }
    }
}