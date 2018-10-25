using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CO5027OnlineShop
{
    public partial class AdminPage : System.Web.UI.Page
    {
        GridViewRow usersRow;
        GridViewRow productsRow;
        IdentityDbContext identityDbContext;
        UserStore<IdentityUser> userStore;
        UserManager<IdentityUser> userManager;

        RoleStore<IdentityRole> roleStore;
        RoleManager<IdentityRole> roleManager;

        etvsEntities db;

        protected void Page_Load(object sender, EventArgs e)
        {
            identityDbContext = new IdentityDbContext("co5027_database_ConnectionString");
            userStore = new UserStore<IdentityUser>(identityDbContext);
            userManager = new UserManager<IdentityUser>(userStore);
            roleStore = new RoleStore<IdentityRole>(identityDbContext);
            roleManager = new RoleManager<IdentityRole>(roleStore);
            update_user_role_button.Visible = false;
            panel_display_product.Visible = false;
            panel_input_product.Visible = false;
            panel_user_display.Visible = false;
            image_val.Visible = false;
            lit_product_table_edit_response.Visible = false;

            if (!(ddl_product_resolution.Items.Count > 0))
            {
                ddl_product_resolution.Items.Add(new ListItem("1920X1080"));
                ddl_product_resolution.Items.Add(new ListItem("3840X2160"));
            }

            if (!(ddl_product_energyefficiencyclass.Items.Count > 0))
            {
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("A***"));
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("A**"));
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("A*"));
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("A"));
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("B"));
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("C"));
                ddl_product_energyefficiencyclass.Items.Add(new ListItem("D"));
            }
            
            if (!(ddl_product_smarttv.Items.Count > 0))
            {
                ddl_product_smarttv.Items.Add(new ListItem("Yes"));
                ddl_product_smarttv.Items.Add(new ListItem("No"));
            }
            try
            {
                if (!(roleManager.RoleExists("Admin")))
                {
                    var adminRole = new IdentityRole("Admin");
                    roleManager.Create(adminRole);
                }
            }
            catch (Exception)
            {

            }
        }
        public void users_selected_index(object sender, EventArgs e)
        {
            panel_user_display.Visible = true;
            usersRow = grid_view_users.SelectedRow;
            usersRow.Cells[0].Style["background-color"] = "#FF5722";
            usersRow.Cells[0].Style["color"] = "#FFFFFF";
            usersRow.Cells[1].Style["background-color"] = "#FF5722";
            usersRow.Cells[1].Style["color"] = "#FFFFFF";
            var user = userManager.FindById(usersRow.Cells[0].Text);
            userID_lit.Text = user.Id;
            if (!userManager.IsInRole(user.Id, "Admin"))
            {
                user_role_lit.Text = "<p>Role: Customer</p>";
                update_user_role_button.Visible = (true);
            }
            else
            {
                user_role_lit.Text = "<p>Role: Admin</p>";
                update_user_role_button.Visible = (false);
            }
        }
        public void users_selected_index_changing(object sender, EventArgs e)
        {
            if (!(grid_view_users.SelectedIndex < 0))
            {
                try
                {
                    usersRow = grid_view_users.SelectedRow;
                    usersRow.Cells[0].Style["background-color"] = "#CFD8DC";
                    usersRow.Cells[0].Style["color"] = "#757575";
                    usersRow.Cells[1].Style["background-color"] = "#CFD8DC";
                    usersRow.Cells[1].Style["color"] = "#757575";
                } catch (Exception)
                {

                }
            }
        }

        public void update_user_role_button_Click(object sender, EventArgs e)
        {

            var user = userManager.FindById(userID_lit.Text);
            userManager.AddToRole(user.Id, "Admin");
            userManager.Update(user);
            if (!userManager.IsInRole(user.Id, "Admin"))
            {
                user_role_lit.Text = "<p>Role: Customer</p>";
                update_user_role_button.Visible = (true);
            }
            else
            {
                user_role_lit.Text = "<p>Role: Admin</p>";
                update_user_role_button.Visible = (false);
            }
        }
        public void products_selected_index(object sender, EventArgs e)
        {
            productsRow = grid_view_products.SelectedRow;
            productsRow.Cells[1].Style["background-color"] = "#FF5722";
            productsRow.Cells[1].Style["color"] = "#FFFFFF";
            productsRow.Cells[2].Style["background-color"] = "#FF5722";
            productsRow.Cells[2].Style["color"] = "#FFFFFF";
            productsRow.Cells[3].Style["background-color"] = "#FF5722";
            productsRow.Cells[3].Style["color"] = "#FFFFFF";
            productsRow.Cells[4].Style["background-color"] = "#FF5722";
            productsRow.Cells[4].Style["color"] = "#FFFFFF";
            productsRow.Cells[5].Style["background-color"] = "#FF5722";
            productsRow.Cells[5].Style["color"] = "#FFFFFF";
            productsRow.Cells[6].Style["background-color"] = "#FF5722";
            productsRow.Cells[6].Style["color"] = "#FFFFFF";
            panel_display_product.Visible = true;
            panel_input_product.Visible = false;
            lit_product_id.Text = productsRow.Cells[1].Text;
            lit_product_name.Text = "<p>Product Name: " + productsRow.Cells[2].Text + "</p>";
            lit_product_price.Text = "<p>Product Price: £" + productsRow.Cells[3].Text + "</p>";
            lit_product_screensize.Text = "<p>Screen Size: " + productsRow.Cells[4].Text + '"' + "</p>";
            lit_product_resolution.Text = "<p>Resolution: " + productsRow.Cells[5].Text + (" (px)</p>");
            lit_product_stock.Text = "<p>Stock: " + productsRow.Cells[6].Text + "</p>";
            db = new etvsEntities();
            int tempID = int.Parse(productsRow.Cells[1].Text);
            var imageData = db.tblImages.FirstOrDefault(p => p.ImageName == tempID);
            if (!(imageData == null))
            {
                string filename = productsRow.Cells[1].Text + imageData.Extension;
                product_image.AlternateText = imageData.AltText;
                product_image.ImageUrl = "~/Images/" + filename + "?n=" + DateTime.Now.Second.ToString();
            } else
            {
                product_image.AlternateText = "";
                product_image.ImageUrl = "";
            }
        }
        public void products_selected_index_changing(object sender, EventArgs e)
        {
            if (!(grid_view_products.SelectedIndex < 0))
            {
                try
                {
                    productsRow = grid_view_products.SelectedRow;
                    productsRow.Cells[1].Style["background-color"] = "#CFD8DC";
                    productsRow.Cells[1].Style["color"] = "#757575";
                    productsRow.Cells[2].Style["background-color"] = "#CFD8DC";
                    productsRow.Cells[2].Style["color"] = "#757575";
                    productsRow.Cells[3].Style["background-color"] = "#CFD8DC";
                    productsRow.Cells[3].Style["color"] = "#757575";
                    productsRow.Cells[4].Style["background-color"] = "#CFD8DC";
                    productsRow.Cells[4].Style["color"] = "#757575";
                    productsRow.Cells[5].Style["background-color"] = "#CFD8DC";
                    productsRow.Cells[5].Style["color"] = "#757575";
                    productsRow.Cells[6].Style["background-color"] = "#CFD8DC";
                    productsRow.Cells[6].Style["color"] = "#757575";
                } catch (Exception)
                {

                }
            }
        }
        public void goto_add_products_button_Click(object sender, EventArgs e)
        {
            panel_display_product.Visible = false;
            panel_input_product.Visible = true;
            edit_product_record_button.Visible = false;
            add_product_record_button.Visible = true;
            lit_product_ID_edit.Text = "";
            txt_product_name.Text = "";
            txt_product_price.Text = "";
            txt_product_information.Text = "";
            txt_product_screensize.Text = "";
            ddl_product_resolution.SelectedIndex = (0);
            ddl_product_energyefficiencyclass.SelectedIndex = (0);
            ddl_product_smarttv.SelectedIndex = (0);
            txt_product_stock.Text = "";
        }

        public void goto_edit_products_button_Click(object sender, EventArgs e)
        {
            db = new etvsEntities();
            int tempID = int.Parse(lit_product_id.Text);
            var entry = db.productsTables.Single(p => p.Id == tempID);
            panel_display_product.Visible = false;
            panel_input_product.Visible = true;
            edit_product_record_button.Visible = true;
            add_product_record_button.Visible = false;
            lit_product_ID_edit.Text = entry.Id + "";
            txt_product_name.Text = entry.ProductName;
            txt_product_price.Text = entry.Price;
            txt_product_information.Text = entry.ProductInformation;
            txt_product_screensize.Text = entry.ScreenSize;
            txt_product_stock.Text = entry.Stock;
            switch (entry.Resolution)
            {
                case ("1920X1080"):
                    ddl_product_resolution.SelectedIndex = 0;
                    break;
                case ("3840X2160"):
                    ddl_product_resolution.SelectedIndex = 1;
                    break;
            }
            switch (entry.EnergyEfficiencyClass)
            {
                case ("A***"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (0);
                    break;
                case ("A**"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (1);
                    break;
                case ("A*"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (2);
                    break;
                case ("A"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (3);
                    break;
                case ("B"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (4);
                    break;
                case ("C"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (5);
                    break;
                case ("D"):
                    ddl_product_energyefficiencyclass.SelectedIndex = (6);
                    break;
            }
            switch (entry.SmartTV)
            {
                case ("Yes"):
                    ddl_product_resolution.SelectedIndex = 0;
                    break;
                case ("No"):
                    ddl_product_resolution.SelectedIndex = 1;
                    break;
            }
        }
        public void delete_products_button_Click(object sender, EventArgs e)
        {
            db = new etvsEntities();
            int tempID = int.Parse(lit_product_id.Text);
            var entry = db.productsTables.SingleOrDefault(p => p.Id == tempID);
            db.productsTables.Remove(entry);
            db.SaveChanges();
            var imagePath = Server.MapPath("~/Images/" + tempID + ".jpg");
            if (!(imagePath == null))
            {
                File.Delete(imagePath);
                db = new etvsEntities();
                int tempImageID = int.Parse(lit_product_id.Text);
                var tblimgentry = db.tblImages.FirstOrDefault(p => p.ImageName == tempImageID);
                if (!(entry == null))
                {
                    db.tblImages.Remove(tblimgentry);
                    db.SaveChanges();
                }
                grid_view_products.DataBind();
                lit_product_table_edit_response.Visible = true;
                lit_product_table_edit_response.Text = "<p>Product Deleted</p>";
                string constr = ConfigurationManager.ConnectionStrings["co5027_database_ConnectionString"].ConnectionString;
                SqlConnection sqlcon = new SqlConnection(constr);
                sqlcon.Open();
                SqlCommand tempcmd = new SqlCommand(@"DELETE FROM [tblBasket] WHERE productID = '" + tempID + "'", sqlcon);
                tempcmd.ExecuteNonQuery();
                sqlcon.Close();

            }
        }
        public void edit_products_button_Click(object sender, EventArgs e)
        {
            Page.Validate("productInformation");
            if (Page.IsValid == true) {
                db = new etvsEntities();
                int tempID = int.Parse(lit_product_ID_edit.Text);
                var entry = db.productsTables.FirstOrDefault(p => p.Id == tempID);
                entry.ProductName = txt_product_name.Text;
                entry.Price = txt_product_price.Text;
                entry.ProductInformation = txt_product_information.Text;
                entry.ScreenSize = txt_product_screensize.Text;
                entry.Resolution = ddl_product_resolution.SelectedItem.Text;
                entry.EnergyEfficiencyClass = ddl_product_energyefficiencyclass.SelectedItem.Text;
                entry.SmartTV = ddl_product_smarttv.SelectedItem.Text;
                entry.Stock = txt_product_stock.Text;
                db.SaveChanges();
                grid_view_products.DataBind();
                lit_product_table_edit_response.Visible = true;
                lit_product_table_edit_response.Text = "<p>Product Edited</p>";
            }
        }
        public void add_products_button_Click(object sender, EventArgs e)
        {
            Page.Validate("productInformation");
            if (Page.IsValid == true)
            {
                db = new etvsEntities();
                var entry = new productsTable();
                entry.ProductName = txt_product_name.Text;
                entry.Price = txt_product_price.Text;
                entry.ProductInformation = txt_product_information.Text;
                entry.ScreenSize = txt_product_screensize.Text;
                entry.Resolution = ddl_product_resolution.SelectedItem.Text;
                entry.EnergyEfficiencyClass = ddl_product_energyefficiencyclass.SelectedItem.Text;
                entry.SmartTV = ddl_product_smarttv.SelectedItem.Text;
                entry.Stock = txt_product_stock.Text;
                db.productsTables.Add(entry);
                db.SaveChanges();
                grid_view_products.DataBind();
                int tempID = entry.Id;
                var imageData = db.tblImages.FirstOrDefault(p => p.ImageName == tempID);
                if ((imageData == null))
                {
                    System.IO.File.Copy(Server.MapPath("~/Images/imagePlaceholder.jpg"), Server.MapPath("~/Images/" + tempID + ".jpg"));
                    var nimageData = new tblImage();
                    nimageData.ImageName = tempID;
                    nimageData.Width = 500;
                    nimageData.Height = 444;
                    nimageData.AltText = "No product image available placeholder";
                    nimageData.Extension = ".jpg";
                    db.tblImages.Add(nimageData);
                    db.SaveChanges();
                }
                lit_product_table_edit_response.Visible = true;
                lit_product_table_edit_response.Text = "<p>Product Added</p>";
            }
        }
        public void upload_image_button_Click(object sender, EventArgs e)
        {

            db = new etvsEntities();

            string extension = (System.IO.Path.GetExtension(fu_product_image.FileName).ToLower());
            if (extension == ".jpg")
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(fu_product_image.PostedFile.InputStream);
                int width = img.Width;
                int height = img.Height;
                if (width == 500 & height == 444) {

                    var imagePath = Server.MapPath("~/Images/" + lit_product_id.Text + ".jpg");
                    if (!(imagePath == null))
                    {
                        File.Delete(imagePath);
                        int tempImageID = int.Parse(lit_product_id.Text);
                        var entry = db.tblImages.FirstOrDefault(p => p.ImageName == tempImageID);
                        if (!(entry == null))
                        {
                            db.tblImages.Remove(entry);
                            db.SaveChanges();
                        }
                    }

                    tblImage imageData = new tblImage();
                    imageData.ImageName = int.Parse(lit_product_id.Text);
                    imageData.AltText = txt_alternate_text.Text;
                    imageData.Width = width;
                    imageData.Height = height;
                    imageData.Extension = extension;
                    db.tblImages.Add(imageData);
                    db.SaveChanges();

                    string filename = lit_product_id.Text + extension;
                    img.Save(Server.MapPath("~/Images/" + filename));

                    lit_product_table_edit_response.Visible = true;
                    lit_product_table_edit_response.Text = "<p>Image Updated</p>";
                } else
                {
                    image_val.Visible = true;
                    image_val.Text = "<p>Make sure that the image dimentions are of width: 500px and height: 444px</p>";
                }
            } else
            {
                image_val.Visible = true;
                image_val.Text = "<p>Make sure that the image is of type .jpg</p>";
            }
        }
    }
}