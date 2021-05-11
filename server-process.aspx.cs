using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace public_records
    {
    public partial class server_process : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
            Response.Clear();
            Response.ContentType = "application/json; charset=utf-8";
            Response.Write(Index());
            Response.End();
   
            }

        public String Index()
            {

           DataTable table= fillDataTable();
           JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
           List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
           Dictionary<string, object> childRow;
          // String new_column_name = "";
           foreach (DataRow row in table.Rows)
               {
               childRow = new Dictionary<string, object>();
               foreach (DataColumn col in table.Columns)
                   {
                  /* new_column_name = col.ColumnName;

                        if (col.ColumnName == "Id")
                            new_column_name = "ID";
                        else if (col.ColumnName == "request_name")
                            new_column_name = "Request Name";
                        else if (col.ColumnName == "request_department")
                            new_column_name = "Request Department";
                        else if (col.ColumnName == "descriptions")
                            new_column_name = "Descriptions";
                        else if (col.ColumnName == "fullfill_date")
                            new_column_name = "Fullfill Date";
                        else if (col.ColumnName == "last_modified")
                            new_column_name = "Modified_date";
                        else if (col.ColumnName == "created_date")
                            new_column_name = "Received Date";*/
                   childRow.Add(col.ColumnName, row[col]);
                   }
               parentRow.Add(childRow);
               }
           return jsSerializer.Serialize(parentRow);
             
  
            }

        public DataTable fillDataTable()
            {
            string query = "SELECT * FROM Public_Record where removed is NULL";

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