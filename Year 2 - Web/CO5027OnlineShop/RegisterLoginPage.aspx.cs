using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace CO5027OnlineShop
{
    public partial class RegisterLoginPage : System.Web.UI.Page
    {
        static string prevURL = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            panel_login_fields.Style["display"] = "block";
            panel_register_fields.Style["display"] = "none";
            try
            {
                if (!IsPostBack)
                {
                    prevURL = Request.UrlReferrer.ToString();
                }
            } catch (Exception)
            {
                prevURL = "~/ default.aspx";
            }

        }

        protected void login_tab_Click_(object sender, EventArgs e)
        {
            panel_login_fields.Style["display"] = "block"; /*Sets some states and properties of some elements on the page*/
            panel_register_fields.Style["display"] = "none";
            btn_login_tab.Style["background-color"] = "#FF5722";
            btn_login_tab.Style["color"] = "#FFFFFF";
            btn_register_tab.Style["background-color"] = "#CFD8DC";
            btn_register_tab.Style["color"] = "#FF5722";
        }

        protected void register_tab_Click_(object sender, EventArgs e)
        {

            panel_register_fields.Style["display"] = "block"; /*Sets some states and properties of some elements on the page*/
            panel_login_fields.Style["display"] = "none";
            btn_register_tab.Style["background-color"] = "#FF5722";
            btn_register_tab.Style["color"] = "#FFFFFF";
            btn_login_tab.Style["background-color"] = "#CFD8DC";
            btn_login_tab.Style["color"] = "#FF5722";
        }

        private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = usermanager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Page.Validate("val_login_fields");
            if (Page.IsValid == true)
            {
                try
                {
                    var identityDbContext = new IdentityDbContext("co5027_database_ConnectionString");

                    var userStore = new UserStore<IdentityUser>(identityDbContext);
                    var userManager = new UserManager<IdentityUser>(userStore);

                    var user = userManager.Find(login_email_input.Text, login_password_input.Text);

                    if (user != null)
                    {
                        literal_account_message_login.Text = "<p></p>";
                        //log user in
                        LogUserIn(userManager, user);

                        Response.Redirect(prevURL);
                    }
                    else
                    {
                        literal_account_message_login.Text = "<p>Sorry, the credentials you have entered are incorrect.</p>";
                    }
                }
                catch (Exception)
                {
                    literal_account_message_login.Text = "<p>Sorry, failure logging in. Please try again.</p>";
                }
            }

        }

        protected void register_Click(object sender, EventArgs e)
        {
            Page.Validate("val_register_fields");
            if (Page.IsValid == true)
            {
                Console.Out.WriteLine("Page is valid");

                var identityDbContext = new IdentityDbContext("co5027_database_ConnectionString");

                var userstore = new UserStore<IdentityUser>(identityDbContext);
                var manager = new UserManager<IdentityUser>(userstore);

                var user = new IdentityUser() { UserName = register_email_input.Text, Email = register_email_input.Text };
                IdentityResult result = manager.Create(user, register_password_input.Text);

                if (result.Succeeded)
                {
                    literal_account_message_login.Text = "<p>Thank you for signing up. You can now login to start making purchases.</p>";
                }
                else
                {
                    literal_account_message_register.Text = "<p>Sorry an error has occured. Please try again.</p>";
                    panel_register_fields.Style["display"] = "block"; /*Sets some states and properties of some elements on the page*/
                    panel_login_fields.Style["display"] = "none";
                    btn_register_tab.Style["background-color"] = "#FF5722";
                    btn_register_tab.Style["color"] = "#FFFFFF";
                    btn_login_tab.Style["background-color"] = "#CFD8DC";
                    btn_login_tab.Style["color"] = "#FF5722";
                }
            }
        }
    }
}