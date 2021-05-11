using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace public_records
    {
    public partial class show_records : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
            DataTable table = fillDataTable();
            foreach (DataRow dr in table.Rows)
                {
                //for example 1st column is an int, 2nd is a string:
                //rowdata.Text += "<tr><td>"+dr[0]+"</td></tr>";
                }

            }

        public DataTable fillDataTable()
            {
            string query = "SELECT * FROM Public_Record where removed=''";

            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["website_webstoreConnectionString"].ConnectionString);
            sqlConn.Open();
            SqlCommand cmd = new SqlCommand(query, sqlConn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            sqlConn.Close();
            return dt;
            }

        }
    }