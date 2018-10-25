using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CO5027OnlineShop
{
    public partial class BasketPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string constr = ConfigurationManager.ConnectionStrings["co5027_database_ConnectionString"].ConnectionString;
                SqlConnection sqlcon = new SqlConnection(constr);
                sqlcon.Open();
                SqlCommand tempcmd = new SqlCommand(@"SELECT COUNT(*) FROM tblBasket WHERE UserID = '" + User.Identity.GetUserId() + "'", sqlcon);

                int recordCount = (int)tempcmd.ExecuteScalar();
                if (recordCount > 0)
                {
                    SqlCommand cmd = new SqlCommand(@"SELECT tblBasket.Quantity,productsTable.Id,productsTable.Price,productsTable.ProductName,tblImages.AltText FROM tblBasket INNER JOIN productsTable ON tblBasket.productID = productsTable.Id INNER JOIN tblImages ON tblBasket.productID = tblImages.ImageName WHERE UserID = '" + User.Identity.GetUserId() + "'", sqlcon);

                    IDataReader idr = cmd.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(idr);

                    rptr_products.DataSource = dt;
                    rptr_products.DataBind();
                    sqlcon.Close();
                    basket_panel.Visible = true;
                    lit_message.Visible = false;
                }
                else
                {
                    basket_panel.Visible = false;
                    lit_message.Visible = true;
                    lit_message.Text = "<p>Basket is empty</p>";
                }

            }
            else
            {
                basket_panel.Visible = false;
                lit_message.Visible = true;
                lit_message.Text = "<p>Login to view and create a basket</p>";

            }
        }

        protected void remove_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["co5027_database_ConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand tempcmd = new SqlCommand(@"DELETE FROM [tblBasket] WHERE UserID = '" + User.Identity.GetUserId() + "'", sqlcon);
            tempcmd.ExecuteNonQuery();
            sqlcon.Close();
            rptr_products.DataBind();
        }
    }
}