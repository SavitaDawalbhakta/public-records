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
    public partial class get_file : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
                int RequestID=0;

             if(Request.QueryString["getID"]!=null)
                 RequestID=Convert.ToInt32(Request.QueryString["getID"]);
           
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["website_webstoreConnectionString"].ConnectionString);

                //string queryString = "select id, request_name,request_email,request_phone,request_department, request_organization, descriptions, fullfill_date, notes,request_disposition,created_date,last_modified_date from Public_Record where Id=" + RequestID;
                string queryString = "select id, request_name,request_email,request_phone,request_department, request_organization, descriptions, fullfill_date, notes,request_disposition, last_modified, created_date, uploads from Public_Record where removed is NULL and Id=" + RequestID;
                
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
                                Response.Write(String.Format("{0}###{1}###{2}###{3}###{4}###{5}###{6}###{7:MM/dd/yyyy}###{8}###{9}###{10:MM/dd/yyyy}###{11:MM/dd/yyyy}###{12}", record[0], record[1], record[2], record[3], record[4], record[5], record[6], record[7], record[8], record[9], record[10], record[11], record[12]));
                                }
                            // Call Close when done reading.
                            reader.Close();
                            }
                        else
                            Response.Write("false");
                        }
                    catch {
                        Response.Write("false");
                    }
                   
                conn.Close();
            }
     

        }
    }