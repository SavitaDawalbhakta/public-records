using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.DirectoryServices;

namespace public_records
    {
    public partial class login : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
           /* Response.Write(System.Security.Principal.WindowsIdentity.GetCurrent().Name + "1---<br/>");
            Response.Write(User.Identity.IsAuthenticated.ToString()+"2---<br/>");
            Response.Write(User.Identity.AuthenticationType + "3---<br/>");
            Response.Write(User.Identity.Name);
            */
            }

        protected void submit_Button_Click(object sender, EventArgs e)
            {
           
                string domain = "wssumits";
                //string username = "ldap";
                //string pwd = "viewldap!";
                string username = (TextBox1.Text).Trim().ToLower();

                string pwd = TextBox2.Text;
                string domainAndUsername = domain + "\\" + username;
                string _path = "LDAP://152.12.30.84";
                string groupname;

                groupname = "CN=Everyone - Faculty/Staff,OU=Recipients,OU=StagingArea,DC=wssu,DC=edu";

            
              if (username == "cobbr" || username == "turnerti" || username == "browniv" || username == "feik")
                    {
                    try
                        {
                        DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);
                        Object obj = entry.NativeObject;


                        DirectorySearcher search = new DirectorySearcher(entry);

                         //search.Filter = "(&(msExchUserAccountControl=0)(SAMAccountName=" + name + ")(memberOf=" + groupname + "))";
                         search.Filter = "(&(msExchUserAccountControl=0)(memberOf=" + groupname + "))";
                        // System.DirectoryServices.SortOption sortOption = new System.DirectoryServices.SortOption("cn", System.DirectoryServices.SortDirection.Ascending);
                        // search.Sort = sortOption;
                        SearchResult ResEnt = search.FindOne();
                        TextBox1.Text = "";

                        if (ResEnt == null)
                            errorMessage.Text = "Invalid Login info!";
                        else
                            {
                            Session["new"] = TextBox1.Text;
                            Response.Redirect("application.aspx");
                            }
                        }
                    catch
                        {
                        errorMessage.Text = "Invalid Password";
                        }
                    }
                else
                {
                        errorMessage.Text = "You're not authorized to access!";
                    }
           

                //Session["new"] = TextBox1.Text;
               // Response.Redirect("application.aspx");
            }

        }
    }