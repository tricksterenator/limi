<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="edu.uh.cs.limi.user.User"%>
<%@page import="edu.uh.cs.limi.main.Codes"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
Insert title here
</title>
</head>
<body>
<%
	User objUser = new User();
	if (request.getParameter("username") != null)
		objUser.setUsername(request.getParameter("username"));
	String password = "";
	if (request.getParameter("password") != null)
		password = request.getParameter("password");
	try {
		int value=objUser.Load();
		if(value!=Codes.Success)
		{
			Exception tempex=new Exception(Codes.GetCodeName(value));
			throw tempex;
		}
		if (objUser.getPassword().equals(password))
		{
			session.setAttribute("User",objUser);
			response.sendRedirect("limimenu.jsp");
		}
		else
		{
			response.sendRedirect("message.jsp?message=Wrong Password");	
		}
	} catch (Exception ex) {
		if(ex.getMessage().equals("NoUsername"))
			response.sendRedirect("message.jsp?message=There is no username");
		else if(ex.getMessage().equals("SqlFailure"))
			response.sendRedirect("message.jsp?message=Database Error. Try Later");
		else
			response.sendRedirect("message.jsp?message=Try Later");
	}
%>
</body>
</html>
