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
    public partial class get_record : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
              int RequestID=0;
           // int RequestID = 1;

            if(Request.QueryString["getID"]!=null)
                 RequestID=Convert.ToInt32(Request.QueryString["getID"]);
           
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["website_webstoreConnectionString"].ConnectionString);

                string queryString = "select Id, request_name, request_department, request_organization, descriptions, fullfill_date, request_disposition from Public_Record where removed is NULL and Id=" + RequestID;
                //SqlCommand com = new SqlCommand(rowdata, conn);


               SqlCommand command =new SqlCommand(queryString, conn);
                    conn.Open();
                    try
                        {
                        SqlDataReader reader = command.ExecuteReader();

                        // Call Read before accessing data.
                        if (reader.HasRows)
                            {
                            while (reader.Read())
                                {
                                IDataRecord record = (IDataRecord)reader;
                                c_ID.Text = record[0].ToString();
                                c_Name.Text = record[1].ToString();
                                c_Org.Text = record[3].ToString();
                                c_Dept.Text = record[2].ToString();
                                c_Desc.Text = record[4].ToString();
                                if (record[5].ToString() != "")
                                    {
                                    DateTime dt = Convert.ToDateTime(record[5].ToString());
                                    c_Rdate.Text = dt.ToString("MM/dd/yyyy");
                                    }
                                else
                                    c_Rdate.Text = "";

                                c_disposition.Text = record[6].ToString();
                                }
                                
                            // Call Close when done reading.
                            reader.Close();
                            errMsg.Text = "";
                            }
                        else
                            errMsg.Text = "<p style='text-align:center; color:red; margin-top:20px'>No Valid Record Found (1)</p>";
                        }
                    catch {
                    errMsg.Text = "<p style='text-align:center; color:red; margin-top:20px'>No Valid Record Found (2)</p>";
                    }
                   
                conn.Close();
            }
     

        }
    }