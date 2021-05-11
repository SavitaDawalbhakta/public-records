<%@ Page language="vb" runat="server" explicit="true" strict="true" %>
<script language="vb" runat="server">
Sub Page_Load(Sender As Object, E As EventArgs) Handles Me.Load
	Dim strRequest As String = Replace(Request.QueryString("f"),  "") '-- if something was passed to the file querystring
	If strRequest <> "" Then 'get absolute path of the file
		Dim path As String = Server.MapPath(strRequest) 'get file object as FileInfo
		Dim file As System.IO.FileInfo = New System.IO.FileInfo(path) '-- if the file exists on the server
		If file.Exists Then 'set appropriate headers
			Response.Clear()
			'Response.Buffer = true
			Response.AppendHeader("Content-Disposition", "attachment; filename=" & file.Name)
			Response.AppendHeader("Content-Length", file.Length.ToString())
			Response.AppendHeader("Accept-Ranges", "bytes")
			Response.ContentType = "application/octet-stream"
			Response.WriteFile(file.FullName)
			Response.Flush
			Response.End 'if file does not exist
		Else
			Response.Write("This file does not exist.")
		End If 'nothing in the URL as HTTP GET
	Else
		'Response.Write("Please provide a file to download.")
		Response.Redirect("dowload.aspx")
	End If
End Sub
</script>