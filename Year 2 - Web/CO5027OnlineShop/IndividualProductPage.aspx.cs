using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CO5027OnlineShop
{
    public partial class IndividualProductPage : System.Web.UI.Page
    {
        etvsEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new etvsEntities();
            if (Request.QueryString["Id"] != null && int.Parse(Request.QueryString["Id"]) > 0) {
                int tempID = int.Parse(Request.QueryString["Id"]);
                var imageData = db.tblImages.FirstOrDefault(p => p.ImageName == tempID);
                if (!(imageData == null))
                {
                    string filename = tempID + imageData.Extension;
                    product_image.AlternateText = imageData.AltText;
                    product_image.ImageUrl = "~/Images/" + filename;
                }
                else
                {
                    product_image.ImageUrl = "";
                    product_image.Width = 0;
                    product_image.Height = 0;
                    product_image.AlternateText = "";

                }
                if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    string constr = ConfigurationManager.ConnectionStrings["co5027_database_ConnectionString"].ConnectionString;
                    SqlConnection sqlcon = new SqlConnection(constr);
                    sqlcon.Open();
                    SqlCommand cmd = new SqlCommand(@"SELECT COUNT(*) from tblBasket WHERE UserID = '" + User.Identity.GetUserId() + "' AND productID = '" + tempID + "'", sqlcon);
                    int recordCount = (int)cmd.ExecuteScalar();
                    if (!(recordCount > 0)) {
                        var currentProduct = db.productsTables.FirstOrDefault(p => p.Id == tempID);
                        range_val_quantity.MaximumValue = currentProduct.Stock;
                        adding_basket_panel.Visible = true;
                        login_message_lit.Visible = false;
                    } else
                    {
                        adding_basket_panel.Visible = false;
                        login_message_lit.Visible = true;
                        login_message_lit.Text = "Item is already in basket. Remove from basket to update quantity desired";
                    }
                } else
                {
                    adding_basket_panel.Visible = false;
                    login_message_lit.Visible = true;
                    login_message_lit.Text = "Go to Account, to login and add a product to the basket";

                }
            } else
            {
                var redirect = "~/ProductsPage.aspx";
                Response.Redirect(redirect);
            }
        }

        protected void add_to_basket_button_Click(object sender, EventArgs e)
        {
            db = new etvsEntities();
            Page.Validate("quantityValidation");
            if(Page.IsValid)
            {
                var entry = new tblBasket();
                entry.UserID = User.Identity.GetUserId();
                entry.productID = int.Parse(Request.QueryString["Id"]);
                entry.Quantity = int.Parse(txt_quantity.Text);
                db.tblBaskets.Add(entry);
                db.SaveChanges();
                var redirect = "~/ProductsPage.aspx";
                Response.Redirect(redirect);
            }
        }
    }
}