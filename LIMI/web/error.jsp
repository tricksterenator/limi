<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><font size="5">
<%
	String message="";
	if(request.getParameter("message")!=null)
		message=request.getParameter("message");
	out.print(message);
		
%>
</font>
<br>
<a href="index.jsp">GIRIS YAP</a>
</center>
</body>
</html>