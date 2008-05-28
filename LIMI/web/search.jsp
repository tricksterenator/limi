<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="edu.uh.cs.limi.main.Search"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.uh.cs.limi.main.Series"%>
<%@page import="edu.uh.cs.limi.main.Codes"%>
<script type="text/javascript">
 document.title='Limi Search';
</script>
<%@ include file="checksession.jsp" %>
 
<%@ include file="header.jsp" %>

<form name="searchform" action="search.jsp" method="get">
<table border=0 cellpadding=0 cellspacing=0 width="100%">
	<tr><td align=center valign=middle>	
	
    <span style="display:inline-block;color:Blue;border-width:0px;border-style:None;font-family:Tunga;font-size:Large;font-weight:bold;font-style:normal;">LIMI Search</span>
    <br />
    <input name="keyword" type="text" id="keyword" tabindex="1" title="Enter the search keywords with spaces between then" onkeydown="fnTrapKD(GoBtn,event)" style="color:#C00000;border-color:Black;font-family:Arial Narrow;font-weight:bold;width:302px;" />
    <input type="submit" name="GoBtn" value="Go" id="GoBtn" tabindex="2" style="background-color:White;border-color:Black;border-style:Solid;font-weight:bold;font-style:italic;width:50px;" />
    <br /> 
    <span style="display:inline-block;color:Gray;font-weight:bold;font-style:italic;width:368px;">enter any number of search words separated by a space</span>
       
    </td></tr></table>
    </form>
   <%
   	try {
   		//	Show all search results
   		Search objSearch=null;
   		if (request.getParameter("keyword") != null)
   		{
   			out.print("<script> document.searchform.keyword.value='"+request.getParameter("keyword")+"'; </script>");
   	objSearch= new Search(request.getParameter("keyword"));
   	ArrayList searchResults=objSearch.DoSearch();
   	Series objSeries;
   	//Printing all search results one by one in a good design
   	if(searchResults.size()>0)
   	{
   		out.print("<table width='80%' >");
   	}
   	for (int index = 0; index < searchResults.size(); index++) {
   		objSeries = (Series) searchResults.get(index);
   		if(objSeries.LoadMedia()==Codes.Success)
   		{
   			out.print("<tr><td class='td_searchresult'><a href='generalview.jsp?seriesid="+objSeries.seriesid+"'>");
   			String urltemp = "wimipermanent/"+objSeries.GetImages().get(0);
                        urltemp = urltemp.replace("\\", "/"); 
                        out.print("<img src='"+urltemp+"' width=100 height=100 border=0></a>");
   			out.print("</td><td valign=top class='td_searchresult'>");
   			if(objSeries.comments.length()>100)
   				out.print(objSeries.comments.substring(0,100).replace("'",""));
   			else
   				out.print(objSeries.comments.replace("'",""));
   			out.print("</td></tr>");
   		}
   		//out.print("<br>Seriesid : "+ String.valueOf(objSeries.seriesid));
   		//out.print("<br>To_studyid : "+ String.valueOf(objSeries.to_studyid));
   		//out.print("<br>Comments : "+ objSeries.comments);									
   	}
   	if(searchResults.size()>0)
   	{
   		out.print("</table>");
   	}
   		}
   	} catch (Exception e) {
   		//out.print("<script>alert('Load Channels:There is an error:"+e.toString()+"');</script>");
   	} finally {
   	}
   %>
    
	<SCRIPT language="javascript">

<!-- When user pushs enter button, this function catches it -->

function fnTrapKD(btn, event){

 if (document.all){

  if (event.keyCode == 13){

   event.returnValue=false;

   event.cancel = true;

   btn.click();

  }

 }

 else if (document.getElementById){

  if (event.which == 13){

   event.returnValue=false;

   event.cancel = true;

   btn.click();

  }

 }

 else if(document.layers){

  if(event.which == 13){

   event.returnValue=false;

   event.cancel = true;

   btn.click();

  }

 }

}

// -->

</SCRIPT>

<%@ include file="footer.jsp" %>