<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="edu.uh.cs.limi.main.Search"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.uh.cs.limi.main.Series"%>
<%@page import="edu.uh.cs.limi.main.Codes"%>
<script type="text/javascript">
 document.title='Limi View All';
</script>
<%@ include file="checksession.jsp" %> 
<%@ include file="header.jsp" %>
<%
   	try {
   		//	Show all search results
   		Search objSearch=null;
   	objSearch= new Search();
   	objSearch.SetSearchCommand("SELECT seriesid, to_studyid, comments FROM Series");
   	ArrayList searchResults=objSearch.DoSearch();
   	Series objSeries;
   	//Printing all search results one by one in a good design
   	if(searchResults.size()>0)
   	{
   		out.print("<table align=center width='80%' >");
   	}
   	for (int index = 0; index < searchResults.size(); index++) {
   		objSeries = (Series) searchResults.get(index);
   		if(objSeries.LoadMedia()==Codes.Success)
   		{
   			out.print("<tr><td class='td_searchresult'><a href='generalview.jsp?seriesid="+objSeries.seriesid+"'>");
                        String urltemp = "wimipermanent/"+objSeries.GetImages().get(0);
                        try{
                        urltemp = urltemp.replace("\\", "/");  
                        } catch (Exception e) {
                            //
                            e.getMessage();
                        }                                            
   			out.print("<img src='" +urltemp+"' width=100 height=100 border=0></a>");
   			out.print("</td><td valign=top class='td_searchresult'>");
   			if(objSeries.comments.length()>150)
   				out.print(objSeries.comments.substring(0,150).replace("'",""));
   			else
   				out.print(objSeries.comments.replace("'",""));
   			out.print("</td></tr>");
   		}								
   	}
   	if(searchResults.size()>0)
   	{
   		out.print("</table>");
   	}
   	} catch (Exception e) {
   		
   	} finally {
   	}
   %>
<%@ include file="footer.jsp" %>