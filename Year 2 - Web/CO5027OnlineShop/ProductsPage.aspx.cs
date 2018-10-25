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
    public partial class ProductsPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            repeaterBind();
        }

        private void repeaterBind()
        {
            string constr = ConfigurationManager.ConnectionStrings["co5027_database_ConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(constr);
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT productsTable.Id,productsTable.ProductName, productsTable.Price, tblImages.ImageName,tblImages.AltText,tblImages.Height,tblImages.Width FROM productsTable INNER JOIN tblImages ON productsTable.Id = tblImages.ImageName", sqlcon);
            IDataReader idr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(idr);
            rptr_products.DataSource = dt;
            rptr_products.DataBind();
            sqlcon.Close();
        }
    }
}