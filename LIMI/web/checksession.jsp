<%@page import="edu.uh.cs.limi.user.*"%>
<%
	User objUser = (User) session.getValue("User"); 
	if (objUser == null)
	{
		//response.forward("index.jsp");

		response.sendRedirect("index.jsp"); 
		return;		
	}
%>