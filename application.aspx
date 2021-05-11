<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="application.aspx.cs" Inherits="public_records.application" %>

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

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
     <script type="text/javascript">
         $(function () {
             $("[id$=fullfillDate]").datepicker({
                 showOn: 'button',
                 buttonImageOnly: true,
                 buttonImage: 'https://jqueryui.com/resources/demos/datepicker/images/calendar.gif'
             });


             $('#TextBox1').change(function(){
                 var id = $('#TextBox1').val();
                 if (id.match(/^([0-9]+)$/)) {
                     $.get("get-file.aspx", { getID: id }, function (data) {
                         var str = $.trim(data);
                         var myArray = str.split('###');
                         if (myArray[0] == "false") {
                             var errorMsg = '<p style="color:#FF3300"> Invalid request ID</p>';
                             $('.errorMsg').show().html(errorMsg);
                             $('#Name').val("");
                             $('#Email').val("");
                             $('#Phone').val("");
                             $('#Org').val("");
                             $('#Dept').val("");
                             $('#Desc').val("");
                             $('#notes').val("");
                             $('#fullfillDate').val("");
                             $('#disposition').val("");
                             $('#receivedDate').val("");
                             $('#Label1').text("");
                             $('#Label2').text("");
                             $('#TextBox2').val("");
                             $("#Button1").attr("disabled", true);
                         }
                         else {
                             $('#Name').val((myArray[1]).trim());
                             $('#Email').val((myArray[2]).trim());
                             $('#Phone').val((myArray[3]).trim());
                             $('#Org').val((myArray[5]).trim());
                             $('#Dept').val((myArray[4]).trim());
                             $('#Desc').val((myArray[6]));
                             $('#notes').val((myArray[8]));
                             $('#fullfillDate').val(myArray[7]);
                             $('#disposition').val(myArray[9]);
                             $('#receivedDate').val(myArray[11]);
                             $('#Label1').text(myArray[10]);
                             $('#Label2').html("<a href='"+myArray[12]+"' target='_blank'>"+myArray[12]+"</a>");
                             $('#TextBox2').val(myArray[12]).attr("readOnly", true);
                             $('.errorMsg').hide();
                             $("#Button1").attr("disabled", false);
                         }
                     });

                 }
                 else {
                     $('#Name').val("");
                     $('#Email').val("");
                     $('#Phone').val("");
                     $('#Org').val("");
                     $('#Dept').val("");
                     $('#Desc').val("");
                     $('#fullfillDate').val("");
                     $('#disposition').val("");
                     $('#receivedDate').val("");
                     $('#notes').val("");
                     $('#label1').text("");
                     $('#label2').text("");
                     $('#TextBox2').val("");
                     $('.errorMsg').hide();
                     $("#Button1").attr("disabled", false);
                 }

             });


         });
    </script>

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
    
   
    </style>

 <!--script type="text/javascript">

     function displayCalendar() {
         var datePicker = document.getElementById('datePicker');
         datePicker.style.display = 'block';
     }

 </script-->

</head>

<body>
    <form id="form1" runat="server">
      <div class="container" style="margin-top: 10px; margin-bottom: 10px; border: solid 0px black">
           <div id="headerContainer">
                <img style="float:left" src="images/wssu-logo.jpg" alt="WSSU logo" />  
           </div>
           <div id="headerTitle">
               <h2>Public Records Requests</h2>
           </div>         
       </div>

       <hr style="width: 100%; border-bottom: 3px solid #D50032; margin-top: 0px;" />
    
       <div class="container" style="background-color:silver;">     
            <asp:Label ID="errorMessage" runat="server" Text=""></asp:Label>  
            <div class="text-center" id="errorMsg" style="margin-top:30px; margin-bottom:20px"></div>   
            <div runat="server" id="theDiv"> 
                <div class="form-group row" style="margin-top:30px; margin-bottom:20px">
                    <label for="ID" class="col-sm-2 col-sm-offset-2 col-form-label text-right">ID</label>
                    <div class="col-sm-4">
                         <asp:TextBox ID="TextBox1" class="form-control" placeholder="" runat="server" value="" MaxLength="10"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ControlToValidate="TextBox1" ErrorMessage="Please enter digits only" ValidationExpression="^[0-9]+$" ForeColor="#FF3300"></asp:RegularExpressionValidator>       
                         <br/>
                         <span>If this is a new record, please leave it blank, system will generate an ID for you.</span><br/>
                         <span class="errorMsg"></span>                       
                   </div>
                </div>
            <hr/>   
            </div>
                  
            
                 
            <div class="form-group row">
                <label for="Name" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Requester Name*</label>
                <div class="col-sm-4">
                     <asp:TextBox ID="Name" class="form-control" placeholder="" runat="server" value="" MaxLength="30"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="Please enter name" ForeColor="#FF3300"></asp:RequiredFieldValidator>           
                </div>
            </div>

            <div class="form-group row">
               <label for="email" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Requester Email*</label>
               <div class="col-sm-4">
                   <asp:TextBox ID="Email" class="form-control" placeholder="" runat="server" value="" MaxLength="40"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Email" ErrorMessage="Please enter email address" ForeColor="#FF3300"></asp:RequiredFieldValidator>                       
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ControlToValidate="Email" ErrorMessage="invalid email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
               </div>
            </div> 
         
            <div class="form-group row">
               <label for="phone" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Requester Phone* <br />xxx-xxx-xxxx</label>
               <div class="col-sm-4">
                   <asp:TextBox ID="Phone" class="form-control" placeholder="" runat="server" value="" MaxLength="25"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Phone" ErrorMessage="Please enter phone" ForeColor="#FF3300"></asp:RequiredFieldValidator>                       
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="Phone" ErrorMessage="invalid phone#" ForeColor="#FF3300" ValidationExpression="\d{3}-\d{3}-\d{4}"></asp:RegularExpressionValidator>
               </div>
            </div>     
         
            <div class="form-group row">
                <label for="org" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Requester Organization*</label>
                <div class="col-sm-4">
                     <asp:TextBox ID="Org" class="form-control" placeholder="" runat="server" value="" MaxLength="30"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Org" ErrorMessage="Please enter organization" ForeColor="#FF3300"></asp:RequiredFieldValidator>           
                </div>
            </div>

            <div class="form-group row">
                <label for="Dept" class="col-sm-2 col-sm-offset-2 col-form-label text-right">WSSU Department(s)*</label>
                <div class="col-sm-4">
                     <asp:TextBox ID="Dept" class="form-control" placeholder="" runat="server" value="" MaxLength="30"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Dept" ErrorMessage="Please enter department" ForeColor="#FF3300"></asp:RequiredFieldValidator>           
                </div>
            </div>

            <div class="form-group row">
                <label for="Name" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Description*</label>
                <div class="col-sm-4">
                     <asp:TextBox ID="Desc" class="form-control" placeholder="" TextMode="multiline" runat="server" value="" Columns="300" Rows="5" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Desc" ErrorMessage="Please enter descriptions" ForeColor="#FF3300"></asp:RequiredFieldValidator>           
                </div>
            </div>
           
           <div class="row">
                <p class="form-group col-md-offset-2 col-md-9"><b>Upload Additional File:</b></p>
                <div class="form-group col-md-offset-2 col-md-9">
                    <label for="fileUpload1" class="control-label">
                        If your description is too long or you have additional file needed to send, please upload your file. The file size is no more than 200 KB. (.doc or .docx or .pdf file only)
                    </label>
                    <asp:FileUpload ID="FileUpload1" runat="server" MaxLength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf)$"
                        ControlToValidate="FileUpload1" runat="server" ForeColor="#FF3300" ErrorMessage="Please upload.doc or .docx or.pdf file."
                        Display="Dynamic" />
                    <br />
                    <asp:Label ID="fileSizeError" runat="server" Text="" ForeColor="#FF3300"></asp:Label>
                </div>
            </div>

            
           <div runat="server" id="Div1"> 
               <hr/>  
              <div class="form-group row">
                   <label for="Rdate" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Received Date</label>
                   <div class="col-sm-4">
                       <asp:TextBox ID="receivedDate" runat="server" value=""></asp:TextBox><br/>
                   </div>
              </div>


              <div class="form-group row">
                <label for="Fdate" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Resolved Date</label>
                <div class="col-sm-4">
                   <asp:TextBox ID="fullfillDate" runat="server" value=""></asp:TextBox><br/>
                </div>
              </div>

              <div class="form-group row">
                <label for="Fdate" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Last Modified Date</label>
                <div class="col-sm-4">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
              </div>
         
              <div class="form-group row">
                <label for="uploaded_file" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Uploaded files</label>
                <div class="col-sm-4">
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </div>
                <asp:TextBox ID="TextBox2" class="form-control" runat="server" placeholder="" value="" style="display:none" ></asp:TextBox>          
              </div>
             
              <div class="form-group row">
               <label for="Notes" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Request Disposition</label>
               <div class="col-sm-4">
                   <asp:TextBox ID="disposition" class="form-control" placeholder="" runat="server" value="" ></asp:TextBox><br/>
               </div>
            </div>  

            <div class="form-group row">
                <label for="Notes" class="col-sm-2 col-sm-offset-2 col-form-label text-right">Notes</label>
                <div class="col-sm-4">
                   <asp:TextBox ID="notes" class="form-control" placeholder="" TextMode="multiline"  runat="server" value="" Columns="300" Rows="5"></asp:TextBox><br/>
                </div>
            </div>  
         </div>

        <div id="fooDiv">
            <asp:TextBox ID="Subject" class="form-control" placeholder="" runat="server" value="" ></asp:TextBox> 
        </div>
        <script>
            (function () {
                var e = document.getElementById("fooDiv");
                e.parentNode.removeChild(e);
            })();
        </script>
         
        <div class="form-group row">
            <div class="text-center">
                <asp:Button ID="Button1" runat="server" Text="Submit" Height="50px" Width="150px" Style="border-radius: 2px; font-size: 20px;" OnClick="Button1_Click" />                              
                <asp:Button ID="Button2" runat="server" Text="Delete" Height="50px" Width="150px" Style="border-radius: 2px; font-size: 20px;" onClientClick="javascript:return confirm('Are you sure you want to delete this record?')" OnClick="Button2_Click" />             
                <asp:Label ID="LabelError" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
        </div>
          
        <br/>
 </form>
    

</body>
</html>
