<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
 document.title='Limi Open Source Medical Solutions';
</script>
<%@ include file="header.jsp" %> 

<br><br><br><br>
    <table class=tblMessage align=center ><tr><td colspan=2 align=center>
    <span class=textMessage>
<%
	String message="";
	if(request.getParameter("message")!=null)
		message=request.getParameter("message");
	out.print(message);
		
%>
</span>
</td>
</tr>
<tr>
<td width=70 align=right>
<form onsubmit='return false;'>
<input type=button value='BACK' onClick='javascript:history.back();'>
</form>
</td>
<td width=70 align=left>
<form action='index.jsp' method=post><input type=submit value='MAINPAGE'></form>
</td>
</tr>
</table>
<%@ include file="footer.jsp" %> 