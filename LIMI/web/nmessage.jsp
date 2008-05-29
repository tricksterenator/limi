<%
	String message="";
	if(request.getParameter("message")!=null)
		message=request.getParameter("message");
	out.print("<h2>"+message+"</h2>");
		
%>