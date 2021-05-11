using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace public_records
    {
    public partial class application : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
                theDiv.Visible = false;
                Div1.Visible = false;
                Button2.Visible = false;

                if (Session["New"] != null)
                {
                    theDiv.Visible = true;
                    Button2.Visible = true;
                    Div1.Visible = true;
                }
                else
                {
                    theDiv.Visible = false;
                    Button2.Visible = false;
                    Div1.Visible = false;
                }
            }

        [Obsolete]
        protected void Button1_Click(object sender, EventArgs e)
            {
                
                 HttpPostedFile file = FileUpload1.PostedFile;

                int iFileSize = file.ContentLength;

                if (iFileSize > 200000)  // 2MB
                {
                    fileSizeError.Text = "File Size is too big.";
                    return;
                }
            
                if(Subject.Text=="") //prevent the robot data enter
                    Server.Transfer("confirmation.aspx");
           



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {

                try
                {
                    SqlConnection conn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["website_webstoreConnectionString"].ConnectionString);
                    conn3.Open();

                    String updateQuery = "update Public_Record set removed='yes' " +
                                             "where id=@id";

                    SqlCommand com = new SqlCommand(updateQuery, conn3);
                    com.Parameters.AddWithValue("@id", TextBox1.Text);
                    com.ExecuteNonQuery();

                    Server.Transfer("show-records.aspx");
                }
                catch (Exception ex)
                {
                    errorMessage.Text = "Delete Error." + ex.Message;
                }

            }
            else {
                errorMessage.Text = "can't find this record in the database.";
            }
        }
        }
    }