<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@ include file="checksession.jsp" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" >
    
    <head>
        <title>Limi </title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <link href="CSS/2.css" rel="stylesheet" type="text/css" />
        <script src="js/prototype.js" type="text/javascript" ></script>
        <script src="js/my.js" type="text/javascript" ></script>
        
    </head>
    
    <body >
        
        <div id="header_table" >
            <img src="images/uhcslogo4.jpg" border="0" >
        </div> <!-- end header_table-->	
                 
        <div id="subheader_table" >	
            <table align="center" width="100%">
                <tbody><tr>
                        <td  align="left"><a href="limimenu.jsp"><img src= "images/home.gif" border="0"></a></td>
                        <td  align="right"><a href="logout.jsp"><img src="images/logout.jpg" border="0" height="40" width="40"></a> </td>
                    </tr>
            </tbody></table>
        </div> <!-- end subheader_table-->
        
        <div id="outer">
            <div id="left" >
                <span  style="color: MediumBlue; font-size: small; font-weight: bold; font-style: normal;">SELECT FILE</span><br>
                
                <select name="dropdown" id="dropdown" style="color: Blue; width:200px " >
                    <%
            String path = application.getRealPath("/");
            path = path + "upload";
            File dir = new File(path);
            String[] filelist = dir.list();
            for (int i = 0; i < filelist.length; i++) {
                if (filelist[i].endsWith(".m")) {
                    out.println("<option>" + filelist[i] + "</option>");
                }
            }
                    %>
                </select>
                
                <input name="" type="submit" style="border-color: Navy; color: Lavender; background-color: rgb(128, 128, 255); font-weight: bold; width: 200px;" onclick="loadpage()"  value="View Metadata" />
                
                <br />
                <br />
                <input name="" value="Search by Comment" onclick='redirectpage("search.jsp")'  style="border-color: Black; color: Lavender; background-color: rgb(128, 128, 255); font-weight: bold; width: 200px;" type="submit">
                <br />
                <br />
                <input name="" value="Upload Dataset" onclick='redirectpage("multipleupload.jsp")' style="border-color: Black; color: Lavender; background-color: rgb(128, 128, 255); font-weight: bold; width: 200px;" type="submit">
                
                
            </div>
            <div id= "content"> <img id="ctl00_mainContent_DefaultImage" src="images/extractmovejpegfile.jpg" style="border-width: 0px; width: 99%;" /> </div>
        </div>
        
        <div id="whitefoot"></div>
        
        <div id="foot">
            <table width="100%" border="0">
                <tr>
                    <td>   <a href="http://mcs.cs.uh.edu/" target="_blank" alt="Wimi Contact"><img src="images/email.jpg" border="0"></a></td>
                    <td align="right"><a href="http://mcs.cs.uh.edu/" target="_blank" alt="Wimi Help"><img src="images/help.gif" border="0"></a></td>
                </tr>
            </table>
        </div>
        
        
    </body>
</html>