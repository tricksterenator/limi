<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="edu.uh.cs.limi.main.Series"%>
<%@page import="edu.uh.cs.limi.main.Codes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="edu.uh.cs.limi.main.ParamsInStudy"%>
<script type="text/javascript">
    document.title='Limi View Series';
    </script>
<%@ include file="checksession.jsp"%>
<%@ include file="header.jsp"%>
<%
            /*Create the series object at the beginning of the page*/
            if (request.getParameter("seriesid") == null) {
                response.sendRedirect("search.jsp");
                return;
            }
            int series_id = Integer.valueOf(request.getParameter("seriesid"));
            Series objSeries = new Series();
            objSeries.seriesid = series_id;
            objSeries.LoadBasicInfo();
            if (request.getParameter("menu") == null) {
                out.print("<div align=left style='padding: 10px;'><b>" + objSeries.patientslastname + " : MainView</b></div>");
            } else {
                out.print("<div align=left style='padding: 10px;'><b>" + objSeries.patientslastname + " : " + ((String) request.getParameter("menu")).toUpperCase() + "</b></div>");
            }
%>
<table align="left" border="0" cellpadding="0" cellspacing="0"
       width="100%" height="100%">
    <tr>
        <td valign=top style="width: 120px;">
            <table border=0 cellpadding="0" cellspacing="0"
                   style="padding-left: 5 px;">
                <tr>
                    <td><a
                            href="generalview.jsp?menu=image&seriesid=<% out.print(series_id);%>"><img
                        src="images/immenu.jpg" border=0 width="120"></a></td>
                </tr>
                <tr>
                    <td><a
                            href="generalview.jsp?menu=video&seriesid=<% out.print(series_id);%>"><img
                        src="images/vimenu.jpg" border=0 width="120"></a></td>
                </tr>
                <tr>
                    <td><a
                            href="generalview.jsp?menu=comment&seriesid=<% out.print(series_id);%>"><img
                        src="images/comenu.jpg" border=0 width="120"></a></td>
                </tr>
                <tr>
                    <td><a
                            href="generalview.jsp?menu=metadata&seriesid=<% out.print(series_id);%>"><img
                        src="images/memenu.jpg" border=0 width="120"></a></td>
                </tr>
                <tr>
                    <td><a
                            href="generalview.jsp?menu=download&seriesid=<% out.print(series_id);%>"><img
                        src="images/dlmenu.jpg" border=0 width="120"></a></td>
                </tr>
            </table>
        </td>
        <td valign=top style="width: 800; height: 650;">
            <table width="100%" style="height: 100%; border: solid 0px #496EB6;"
                   cellpadding=0 cellspacing=0 border=0>
                <tr>
                    <td valign=top style="padding: 10px;">
                        <%
            /*This area is for the changes, other parts are static*/
            if (request.getParameter("menu") == null) {
                out.print("<br /><br /><br /><br /><br /><br /><center>Click any of the button on the left side to see the specific information of the patient</center>");
            } else {
                try {
                    String selectedmenu = request.getParameter("menu");
                    if (selectedmenu.equals("image")) {
                        //Operations for image menu
                        if (objSeries.LoadMedia() == Codes.Success) {
                            if (objSeries.GetImages().size() > 0) {
                                out.print("<table align=center cellpadding=2 cellspacing=2 border=0 width='%90'><tr><td valign='top'>");
                                String link = "";
                                for (int index = 0; index < objSeries.GetImages().size(); index++) {
                                    link = "generalview.jsp?menu=" + selectedmenu + "&seriesid=" + String.valueOf(objSeries.seriesid) + "&imagenumber=" + String.valueOf(index);
                                    String urltemp = "wimipermanent/" + objSeries.GetImages().get(index);
                                    urltemp = urltemp.replace("\\", "/");
                                    //out.print("<td><a href='" + link + "' ><img src='" + urltemp + "' width='100' height='100' border=0 ></a></td>");
                                    out.print("<a href='"+ link+ "' ><img src='"+ urltemp+ "' width='120' height='120' style='border-color:red;border-width:1px;border-style:solid;' ></a><br>");
										
                                }
                                out.print("</td><td valign='top'>");
                                int imagenumber = 0;
                                if (request.getParameter("imagenumber") != null) {
                                    imagenumber = Integer.valueOf(request.getParameter("imagenumber"));
                                }
                                String urltemp = "wimipermanent/" + objSeries.GetImages().get(imagenumber);
                                urltemp = urltemp.replace("\\", "/");
                                out.print("<center><img src='"+ urltemp + "' border=0 width=630></center></td></tr></table>");									
                                //out.print("<center><img src='" + urltemp + "' border=0 width=630></center> ");
                            }  else {
                                out.print("<center><b>This series does not have any image to show</b></center>");
                            }
                        }
                    //Operations for image menu
                    } else if (selectedmenu.equals("video")) {
                        //Operations for video menu
                        if (objSeries.LoadMedia() == Codes.Success) {
                            if (objSeries.GetVideos().size() > 0) {
                                out.print("<table align=left cellpadding=2 cellspacing=2 border=0 width='%90'><tr><td valign='top'>");
                                String link = "";
                                int index;
                                File videoFile;
                                String videopath;
                                int counter = 0; //to count existence of video files
                                for (index = 0; index < objSeries.GetImages().size(); index++) {
                                    videopath = getServletContext().getRealPath("wimipermanent/") + "//" + ((String) objSeries.GetVideos().get(index)).replaceAll("/", "\\");
                                    videoFile = new File(videopath);
                                    if (videoFile.exists()) {
                                        link = "generalview.jsp?menu=" + selectedmenu + "&seriesid=" + String.valueOf(objSeries.seriesid) + "&videonumber=" + String.valueOf(index);
                                        out.print("<a href='" + link + "' ><img src='images/videodefault.jpg' width='100' height='100' border=0 ></a><br>");
                                        counter++;
                                    }
                                }
                                out.print("</td><td style='width:100px;'>&nbsp;</td><td valign='top'>");
                                if (counter > 0) {
                                    int videonumber = 0;
                                    if (request.getParameter("videonumber") != null) {
                                        videonumber = Integer.valueOf(request.getParameter("videonumber"));
                                    }
                                    videopath = getServletContext().getRealPath("wimipermanent/") + "//" + objSeries.GetVideos().get(videonumber);
                        %>
                        <jsp:include page="videoviewer.jsp" 	
flush="true| false" >	
                            <jsp:param name="videopath"	value="<%= videopath %>" />	
                        </jsp:include>
                        
                        <%
                                } else {
                                    out.print("<center><b>This series does not have any video to show</b></center>");
                                }
                                out.print("</td></tr></table>");
                            } else {
                                out.print("<center><b>This series does not have any video to show</b></center>");
                            }
                        }
                    //Operations for video menu
                    } else if (selectedmenu.equals("comment")) {
                        out.print(objSeries.comments.replace("'", ""));
                    } else if (selectedmenu.equals("metadata")) {
                        ParamsInStudy objParamsInStudy = new ParamsInStudy(series_id);
                        if (objParamsInStudy.GetParameters() == Codes.Success) {
                            out.print("<table cellspacing='0' rules='all' border='1' id='Parametersgrid' style='color:MediumSlateBlue;font-family:Book Antiqua;font-size:Small;font-weight:normal;border-collapse:collapse;'>");
                            out.print("<tr><td><font color='MediumSlateBlue'>PARAMETER</font></td><td ><font color='MediumSlateBlue'>VALUE</font></td></tr>");
                            for (int index = 0; index < objParamsInStudy.parameternames.size(); index++) {
                                out.print("<tr align='left' valign='middle' style='color:#404040;background-color:White;font-family:Arial;font-size:12px;'>");
                                out.print("<td>" + objParamsInStudy.parameternames.get(index) + "</td><td>" + objParamsInStudy.parametervalues.get(index) + "</tr>");
                            }
                            out.print("</table>");
                        } else {
                            out.print("<center><b>This series does not have any metadata to show</b></center>");
                        }
                    } else if (selectedmenu.equals("download")) {
                        out.print("<center><font color='CornflowerBlue' size='+2'>Files available for download</font><br>");
                        String currentUrl = request.getRequestURI();
                        int lastslashlocation = currentUrl.lastIndexOf("/");
                        String parentUrl = currentUrl.substring(0, lastslashlocation);
                        out.print("<a href='" + parentUrl + "/wimipermanent/" + objSeries.patientslastname + "/" + "Input.zip'>Input</a><br>");
                        out.print("<a href='" + parentUrl + "/wimipermanent/" + objSeries.patientslastname + "/" + "Output.zip'>Output</a><br>");
                        out.print("<a href='" + parentUrl + "/wimipermanent/" + objSeries.patientslastname + "/" + "Graphic_Output.zip'>Graphic_Output</a></center>");
                    }
                } catch (Exception e) {
                    out.print(e.toString());
                } finally {

                }
            }
        /*This area is for the changes, other parts are static*/
                        %>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<%@ include file="footer.jsp"%>