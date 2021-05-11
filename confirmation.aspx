<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="public_records.confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>WSSU Public Records Application</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
   

    <style>
        @media screen and (min-width: 992px) {
            #headerTitle {
                margin-top: 30px;
                float: right;
            }
       }

         @media screen and (max-width: 992px) {
            #headerTitle {
                 float: left;
            }
       }

         #datePicker
        {
            display:none;
            background-color:white;
        }
        .content
        {
            width:400px;
            background-color:white;
            margin:auto;
            padding:10px;
        }
   
        #IDYes {
            height: 29px;
            width: 34px;
        }
   
    </style>

 <script type="text/javascript">

     function displayCalendar() {
         var datePicker = document.getElementById('datePicker');
         datePicker.style.display = 'block';
     }

 </script>

</head>

<body>
    <form id="form1" runat="server">
      <div class="container" style="margin-top: 10px; margin-bottom: 10px; border: solid 0px black">
           <div id="headerContainer">
                <img style="float:left" src="images/wssu-logo.jpg"/>  
           </div>
           <div id="headerTitle">
               <h2>Public Records Requests</h2>
           </div>         
       </div>

       <hr style="width: 100%; border-bottom: 3px solid #D50032; margin-top: 0px;" />
    
     <div class="container" style="background-color:silver;">
        <asp:Label ID="errorMessage" Display="Dynamic" runat="server" Text="" ForeColor="Red"></asp:Label>
          <div runat="server" id="theDiv"> 
                <div class="form-group row" id="IDSection" style="margin-top:30px;"  runat="server">
                    <label for="c_ID" class="control-label col-sm-2 col-sm-offset-2">Requester ID</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_ID" runat="server" Text=""></asp:Label></span>
                </div>
          </div>
         
         <hr style="width: 80%; border-bottom: 1px solid black; margin-top: 0px;" />
          

         <br/>
                <div class="form-group row">
                    <label for="c_name" class="control-label col-sm-2 col-sm-offset-2">Requester Name</label>
                     <span class="control-label col-sm-6"><asp:Label ID="c_name" runat="server" Text=""></asp:Label>
                      </span>
                </div>

                 <div class="form-group row">
                    <label for="c_email" class="control-label col-sm-2 col-sm-offset-2">Requester Email</label>
                     <span class="control-label col-sm-6"><asp:Label ID="c_email" runat="server" Text=""></asp:Label>
                      </span>
                 </div>

                 <div class="form-group row">
                    <label for="c_phone" class="control-label col-sm-2 col-sm-offset-2">Requester Phone</label>
                     <span class="control-label col-sm-6"><asp:Label ID="c_phone" runat="server" Text=""></asp:Label>
                      </span>
                 </div>

                <div class="form-group row">
                    <label for="c_organization" class="control-label col-sm-2 col-sm-offset-2">Requester Organization</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_organization" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="form-group row">
                    <label for="c_department" class="control-label col-sm-2 col-sm-offset-2">Department(s)</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_department" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="form-group row">
                    <label for="c_description" class="control-label col-sm-2 col-sm-offset-2">Description</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_description" runat="server" Text=""></asp:Label></span>
                </div>            

                <div class="form-group row">
                    <label for="c_FileUpload1" class="control-label col-sm-2 col-sm-offset-2">Uploaded File</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_FileUpload1" runat="server" Text=""></asp:Label></span>
                </div>       

          

            <div runat="server" id="Div1"> 
                 <hr/>
                  <div class="form-group row">
                    <label for="c_receive_date" class="control-label col-sm-2 col-sm-offset-2">Receive Date</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_receive_date" runat="server" Text=""></asp:Label></span>
                </div>

               <div class="form-group row">
                    <label for="c_fullfill_date" class="control-label col-sm-2 col-sm-offset-2">Fullfillment Date</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_fullfill_date" runat="server" Text=""></asp:Label></span>
                </div>

              <div class="form-group row">
                    <label for="c_disposition" class="control-label col-sm-2 col-sm-offset-2">Request Disposition</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_disposition" runat="server" Text=""></asp:Label></span>
                </div>

                 <div class="form-group row">
                    <label for="c_notes" class="control-label col-sm-2 col-sm-offset-2">Notes</label>
                    <span class="control-label col-sm-6"><asp:Label ID="c_notes" runat="server" Text=""></asp:Label></span>
                </div>

          </div>

                <div class="form-group">
                <div class="text-center">
                    <a href="javascript:history.go(-1)" style="color:#D50032; margin-right:30px; font-size:20px; text-decoration:underline">Edit</a>
                    <asp:Button ID="submit_Button" runat="server" Height="50px" Width="150px" Text="Confirm" Style="border-radius: 2px; font-size: 20px;" OnClick="submit_Button_Click" />
                </div>
            </div>

      
   </div>
 </form>

</body>
</html>

