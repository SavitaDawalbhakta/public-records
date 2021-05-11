using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Data;

namespace public_records
{
    public partial class confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["New"] != null)
                {
                    theDiv.Visible = true;
                    Div1.Visible = true;
                }
                else
                {
                    theDiv.Visible = false;
                    Div1.Visible = false;
                }

                Page prevPage = Page.PreviousPage;

                if (((TextBox)Page.PreviousPage.FindControl("TextBox1")).Text != null)
                    c_ID.Text = ((TextBox)Page.PreviousPage.FindControl("TextBox1")).Text.Trim();
                else
                    c_ID.Text = "";


                c_name.Text = ((TextBox)Page.PreviousPage.FindControl("Name")).Text.Trim();
                c_email.Text = ((TextBox)Page.PreviousPage.FindControl("Email")).Text.Trim();
                c_phone.Text = ((TextBox)Page.PreviousPage.FindControl("Phone")).Text.Trim();
                c_organization.Text = ((TextBox)Page.PreviousPage.FindControl("Org")).Text.Trim();
                c_department.Text = ((TextBox)Page.PreviousPage.FindControl("Dept")).Text.Trim();

                c_description.Text = ((TextBox)Page.PreviousPage.FindControl("Desc")).Text.Trim();

                if (((TextBox)Page.PreviousPage.FindControl("receivedDate")).Text != null)
                    c_receive_date.Text = ((TextBox)Page.PreviousPage.FindControl("receivedDate")).Text;
                else
                    c_receive_date.Text = "";

                if (((TextBox)Page.PreviousPage.FindControl("fullfillDate")).Text != null)
                    c_fullfill_date.Text = ((TextBox)Page.PreviousPage.FindControl("fullfillDate")).Text;
                else
                    c_fullfill_date.Text = "";

                if (((TextBox)Page.PreviousPage.FindControl("notes")).Text != null)
                    c_notes.Text = ((TextBox)Page.PreviousPage.FindControl("notes")).Text.Trim();
                else
                    c_notes.Text = "";

                if (((TextBox)Page.PreviousPage.FindControl("disposition")).Text != null)
                    c_disposition.Text = ((TextBox)Page.PreviousPage.FindControl("disposition")).Text.Trim();
                else
                    c_disposition.Text = "";


                FileUpload control = (FileUpload)Page.PreviousPage.FindControl("FileUpload1");
                if (control.HasFile)
                {
                    try
                    {
                        string filename = control.FileName;
                        //string extension = filename.Substring(filename.IndexOf("."));
                        //control.SaveAs(Server.MapPath("~/vendorLicense/") +  c_phone.Text + extension);
                        //StatusLabel.Text = "Upload status: File uploaded!";

                        control.SaveAs(Server.MapPath("~/files/") + filename);
                        c_FileUpload1.Text = filename;
                    }
                    catch (Exception ex)
                    {
                        errorMessage.Text = "Upload status: uploaded file couldn't save" + ex.Message;
                        return;
                    }
                }
                else if (((TextBox)Page.PreviousPage.FindControl("TextBox2")).Text != "")
                {
                    c_FileUpload1.Text = ((TextBox)Page.PreviousPage.FindControl("TextBox2")).Text;
                }
                else
                    c_FileUpload1.Text = "";

            }
        }

        protected void submit_Button_Click(object sender, EventArgs e)
        {
            bool checkError = false;
            bool checkError_email = false;
            int seq_number=0;
            //insert to database
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["website_webstoreConnectionString"].ConnectionString);
                conn.Open();

                /*CREATE SEQUENCE SEQ_PubRecd START WITH 1000 INCREMENT BY 1;*/
                string next_number = "SELECT NEXT VALUE FOR SEQ_PubRecd";
                SqlCommand com1 = new SqlCommand(next_number, conn);
                seq_number = Convert.ToInt32(com1.ExecuteScalar().ToString());

                if (c_ID.Text.Equals(""))
                {
                    string insertQuery = "";
                    if (c_fullfill_date.Text != "")
                        insertQuery = "insert into Public_Record(seq_number,request_name, request_email, request_phone, request_department, request_organization,descriptions, created_date, fullfill_date,notes, request_disposition,uploads) values(@seq, @name, @email, @phone, @dept, @org, @desc, @create, @fullfill, @notes, @disposition,@uploads)";
                    else
                        insertQuery = "insert into Public_Record(seq_number,request_name, request_email, request_phone, request_department, request_organization,descriptions, created_date, notes,request_disposition,uploads) values(@seq, @name, @email, @phone, @dept, @org, @desc, @create, @notes,@disposition,@uploads)";

                    SqlCommand com = new SqlCommand(insertQuery, conn);

                    com.Parameters.AddWithValue("@seq", seq_number);
                    com.Parameters.AddWithValue("@name", c_name.Text);
                    com.Parameters.AddWithValue("@email", c_email.Text);
                    com.Parameters.AddWithValue("@phone", c_phone.Text);
                    com.Parameters.AddWithValue("@dept", c_department.Text);

                    com.Parameters.AddWithValue("@org", c_organization.Text);
                    com.Parameters.AddWithValue("@desc", c_description.Text);
                   // com.Parameters.AddWithValue("@create", DateTime.Now);

                    if (c_receive_date.Text != "")
                        com.Parameters.AddWithValue("@create", c_receive_date.Text);
                    else
                        com.Parameters.AddWithValue("@create", DateTime.Now);

                    if (c_fullfill_date.Text != "")
                        com.Parameters.AddWithValue("@fullfill", c_fullfill_date.Text);

                    com.Parameters.AddWithValue("@notes", c_notes.Text);
                    com.Parameters.AddWithValue("@disposition", c_disposition.Text);
                    if (c_FileUpload1.Text != ""){
                        if  (!c_FileUpload1.Text.ToString().Contains("www.wssu.edu"))
                            com.Parameters.AddWithValue("@uploads", "https://www.wssu.edu/public-records/files/" + c_FileUpload1.Text);
                        else 
                            com.Parameters.AddWithValue("@uploads",c_FileUpload1.Text);
                    }
                   else 
                        com.Parameters.AddWithValue("@uploads", "");
                   
                    com.ExecuteNonQuery();
                }
                else
                {
                    string updateQuery = "";
                    // errMsg.Text = c_fullfill_date.Text.Contains("/");
                    if (c_fullfill_date.Text.Contains("/"))
                    {
                        updateQuery = "update Public_Record set request_name=@name, " +
                                          "request_email=@email, " +
                                          "request_phone=@phone, " +
                                          "request_department=@dept, " +
                                          "request_organization=@org, " +
                                          "descriptions=@desc, " +
                                          "fullfill_date=@fullfill, " +
                                          "last_modified=@moddate, " +
                                          "notes=@notes, " +
                                          "created_date=@created, " +
                                          "request_disposition=@disposition, " +
                                          "uploads=@uploads " +
                                          "where id=@id";
                    }
                    else
                    {
                        updateQuery = "update Public_Record set request_name=@name, " +
                                        "request_email=@email, " +
                                         "request_phone=@phone, " +
                                         "request_department=@dept, " +
                                         "request_organization=@org, " +
                                         "descriptions=@desc, " +
                                         "last_modified=@moddate, " +
                                         "notes=@notes, " +
                                         "created_date=@created, " +
                                         "request_disposition=@disposition, " +
                                         "uploads=@uploads " +
                                         "where id=@id";
                    }

                    SqlCommand com = new SqlCommand(updateQuery, conn);

                    com.Parameters.AddWithValue("@name", c_name.Text);
                    com.Parameters.AddWithValue("@email", c_email.Text);
                    com.Parameters.AddWithValue("@phone", c_phone.Text);

                    com.Parameters.AddWithValue("@dept", c_department.Text);
                    com.Parameters.AddWithValue("@org", c_organization.Text);
                    com.Parameters.AddWithValue("@desc", c_description.Text);
                    if (c_fullfill_date.Text.Contains("/"))
                    {
                        DateTime dt = Convert.ToDateTime(c_fullfill_date.Text);
                        com.Parameters.AddWithValue("@fullfill", dt);
                    }
                    com.Parameters.AddWithValue("@moddate ", DateTime.Now);
                    com.Parameters.AddWithValue("@notes ", c_notes.Text);


                    if (c_receive_date.Text.Contains("/"))
                    {
                        DateTime dt = Convert.ToDateTime(c_receive_date.Text);
                        com.Parameters.AddWithValue("@created", dt);
                    }

                    com.Parameters.AddWithValue("@disposition ", c_disposition.Text);
                    if (c_FileUpload1.Text != "") {
                        if (!c_FileUpload1.Text.ToString().Contains("www.wssu.edu"))
                            com.Parameters.AddWithValue("@uploads", "https://www.wssu.edu/public-records/files/" + c_FileUpload1.Text);
                        else
                            com.Parameters.AddWithValue("@uploads", c_FileUpload1.Text);
                    }
                    else
                        com.Parameters.AddWithValue("@uploads", "");
                    
                    com.Parameters.AddWithValue("@id", Int32.Parse(c_ID.Text));
                    com.ExecuteNonQuery();

                }
                conn.Close();
            }
            catch (Exception ex)
            {
                checkError = true;
                errorMessage.Text = "Submission Data Error." + ex.Message;
            }

            /*send email */
            if (c_ID.Text.Equals("") && checkError == false)
            {
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["website_webstoreConnectionString"].ConnectionString);
                conn1.Open();

                string selectID = "SELECT id From Public_Record where seq_number=" + seq_number;
                SqlCommand com1 = new SqlCommand(selectID, conn1);
                String ID=com1.ExecuteScalar().ToString();
                conn1.Close();

                SmtpClient smtpClient = new SmtpClient();
                MailMessage message = new MailMessage();
                try
                {

                    //you can provide invalid from address. but to address Should be valil
                    MailAddress fromAddress = new MailAddress(ConfigurationManager.AppSettings["FromEmailAddress"].ToString(), ConfigurationManager.AppSettings["FromEmailDisplayName"].ToString());

                    smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"].ToString();
                    smtpClient.Port = Int32.Parse(ConfigurationManager.AppSettings["SMTPPort"]);
                    //smtpClient.Port = 587;

                    smtpClient.UseDefaultCredentials = false;

                    message.From = fromAddress;
                    //message.To.Add(c_firstContactEmail.Text);
                    message.To.Add(ConfigurationManager.AppSettings["AddEmailAddress1"].ToString());
                    //message.To.Add(ConfigurationManager.AppSettings["BCCEmailAddress"].ToString());

                    message.To.Add(c_email.Text);
                    //message.Bcc.Add(ConfigurationManager.AppSettings["AddEmailAddress2"].ToString());
                    message.Bcc.Add(ConfigurationManager.AppSettings["BCCEmailAddress"].ToString()); //Recipent email 
                    message.Bcc.Add(ConfigurationManager.AppSettings["AddEmailAddress1"].ToString()); //Recipent email 
                    message.Subject = "New Public Records Application Confirmation";


                    string body = string.Empty;
                    using (StreamReader reader = new StreamReader(Server.MapPath("~/public-records-email.html")))
                    {
                        body = reader.ReadToEnd();
                    }

                    body = body.Replace("{c_id}", ID);
                    body = body.Replace("{c_name}", c_name.Text);
                    body = body.Replace("{c_email}", c_email.Text);
                    body = body.Replace("{c_phone}", c_phone.Text);
                    body = body.Replace("{c_organization}", c_organization.Text);
                    body = body.Replace("{c_department}", c_department.Text);
                    body = body.Replace("{c_description}", c_description.Text);
                    body = body.Replace("{c_uploads}", c_FileUpload1.Text);
                    body = body.Replace("{link}", "https://www.wssu.edu/public-records/get-record.aspx?getID=" + ID);

                    message.Body = body;

                    message.IsBodyHtml = true;

                   // smtpClient.EnableSsl = true; 


                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

                    smtpClient.Send(message);

                    Response.Write("Email sent.");
                }
                catch (Exception)
                {
                    checkError_email = true;
                    errorMessage.Text = "Invalid Email Address.";
                }
                
              }/*end email sending*/

////////////////////////////////////////////////////////////////////////////////////////////////////
        /*    try
            {
                // LabelError.Text = Email.Text;
                //LabelError.Visible = true;
                //Response.Write(Email.Text);
                MailMessage mail = new MailMessage();
                mail.To.Add(c_email.Text);
                mail.From = new MailAddress("dawalbhaktass@wssu.edu");
                mail.Subject = "Subject:Test Mail";
                //mail.Body = Request.Form["txtmsg"];
                mail.Body = "This is Email body text" + c_ID.Text;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "mail.wssu.edu";
                smtp.Port = 25;
                smtp.UseDefaultCredentials = true;
                //smtp.Credentials = new System.Net.NetworkCredential("savita.dawal@gmail.com", "myGmail2019");
                smtp.EnableSsl = true;

                smtp.Send(mail);
                // lblmsg.Text = "Mail Send .......";
                Server.Transfer("test.aspx");
            }
            catch (Exception ex)
            {
                errorMessage.Text = ex.Message;

            }*/

////////////////////////////////////////////////////////////////////////////////////////////////
            if (checkError == false && checkError_email==false)
                {
                    Response.Redirect("show-records.aspx");
                }
            }
        }
    }
