<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="public_records.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>WSSU Public Records Admin Login</title>

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

      
        .content
        {
            width:400px;
            background-color:white;
            margin:auto;
            padding:10px;
        }
     
    </style>



</head>

<body>
    <form id="form1" runat="server">
      <div class="container" style="margin-top: 10px; margin-bottom: 10px; border: solid 0px black">
           <div id="headerContainer">
                <img style="float:left" src="images/wssu-logo.jpg"/>  
           </div>
           <div id="headerTitle">
               <h2>Public Records Admin login</h2>
           </div>         
       </div>

       <hr style="width: 100%; border-bottom: 3px solid #D50032; margin-top: 0px;" />
    
     <div class="container" style="background-color:silver; min-height:200px">
        <span><asp:Label ID="errorMessage" Display="Dynamic" runat="server" Text="" ForeColor="Red"></asp:Label></span>
         <br/>
        <div class="form-group row">
             <label for="Name" class="col-sm-2 col-sm-offset-2 col-form-label text-right">User ID*</label>
              <div class="col-sm-4">
                   <asp:TextBox ID="TextBox1" class="form-control" placeholder="" runat="server" value="" MaxLength="20"></asp:TextBox>   
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter user ID" ForeColor="#FF3300"></asp:RequiredFieldValidator>                                        
               </div>
        </div>
         <div class="form-group row">
             <label for="password" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Password*</label>
             <div class="col-sm-4">
                  <asp:TextBox ID="TextBox2" class="form-control" placeholder="" runat="server" value=""  TextMode="Password"></asp:TextBox> 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter user ID" ForeColor="#FF3300"></asp:RequiredFieldValidator>                                        
                                                     
             </div>
        </div>
        <div class="text-center">
             <asp:Button ID="submit_Button" runat="server" Height="50px" Width="150px" Text="Login" Style="border-radius: 2px; font-size: 20px;" OnClick="submit_Button_Click" />
        </div>      
     </div>
 </form>
</body>
</html>

