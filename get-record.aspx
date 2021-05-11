<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="get-record.aspx.cs" Inherits="public_records.get_record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Winston-Salem State University Public Records</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>
     <link href="css/bootstrap.min.css" rel="stylesheet" />
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

         .dataTables_wrapper {
            margin-top:30px;
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
               <h2>Public Records Requests</h2>
           </div>         
       </div>

       <hr style="width: 100%; border-bottom: 3px solid #D50032; margin-top: 0px;" />
    
         <div class="container" style="background-color:silver;">
            <asp:Label ID="errMsg" runat="server" Text=""></asp:Label>

           <div class="form-group row" style="margin-top:30px; margin-bottom:20px">
               <label for="ID" class="col-sm-2 col-sm-offset-2 col-form-label text-right">ID<br />
                </label>
                 <span class="control-label col-sm-6"><asp:Label ID="c_ID" runat="server" Text=""></asp:Label></span>
           </div>
          
            <div class="form-group row">
                <label for="Name" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Requester Name</label>
                  <span class="control-label col-sm-6"><asp:Label ID="c_Name" runat="server" Text=""></asp:Label></span>
            </div>

            <div class="form-group row">
                <label for="org" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Requester Organization</label>
                 <span class="control-label col-sm-6"> <asp:Label ID="c_Org" runat="server" Text=""></asp:Label></span>
            </div>

            <div class="form-group row">
                <label for="Dept" class="col-sm-2 col-sm-offset-2 col-form-label text-right"> WSSU Department(s)</label>
                <span class="control-label col-sm-6"><asp:Label ID="c_Dept" runat="server" Text=""></asp:Label></span>
            </div>

            <div class="form-group row">
                <label for="Desc" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Description</label>
                <span class="control-label col-sm-6"><asp:Label ID="c_Desc" runat="server" Text=""></asp:Label></span>
            </div>

            <div class="form-group row">
               <label for="Rdate" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Resolved Date</label>
              <span class="control-label col-sm-6"> <asp:Label ID="c_Rdate" runat="server" Text=""></asp:Label></span>
            </div>

              <div class="form-group row">
               <label for="Rdate" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Request Disposition</label>
              <span class="control-label col-sm-6"> <asp:Label ID="c_disposition" runat="server" Text=""></asp:Label></span>
            </div>
               
            <div class="form-group row">
                <div class="text-right">
                    <a href="javascript:history.go(-1)" style="color:#D50032; margin-right:30px; font-size:20px; text-decoration:underline">Back Home</a>
                </div>
            </div>   

           <br/> <br/> <br/>  
         </div>     
    </form>
</body>
</html>
