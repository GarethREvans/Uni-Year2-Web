using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
namespace CO5027OnlineShop
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool testAuthentication = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            button_account.Style["display"] = "inline-block";
            if (testAuthentication == true)
            {
                button_account.Text = "Logout";
            } else {
                button_account.Text = "Account";
            }
        }

        protected void account_Click(object sender, EventArgs e)
        {
            bool testAuthentication = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (testAuthentication == true)
            {
                HttpContext.Current.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
                button_account.Text = "Account";
            } else
            {
                var redirect = "~/RegisterLoginPage.aspx";
                Response.Redirect(redirect);
            }

        }

    }
}