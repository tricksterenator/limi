<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="imagetoolbar" content="no">
<meta name="MSSmartTagsPreventParsing" content="true">

<style type="text/css">
body
{
    margin: 0;
    padding: 0;
    border: none;
    font-size: 14 pt;
    SCROLLBAR-FACE-COLOR: #77ADC9;
    SCROLLBAR-HIGHLIGHT-COLOR: white; 
    SCROLLBAR-SHADOW-COLOR: #efefef; 
    SCROLLBAR-TRACK-COLOR: #efefef; 
    SCROLLBAR-DARKSHADOW-COLOR: #efefef; 
    SCROLLBAR-BASE-COLOR: #efefef;
}

html, body{height:100%}

.main_table
{
   width:80%;
   height:100%;
   background-color:#ffffff;  
   border-color:#77ADC9;
   border-right-width:0px;
   border-left-width:0px;
   border-top-width:0px;
   border-bottom-width:0px;
   border-style:solid;
}

.header_table
{
   background-color:#77ADC9;
   border-color:#77ADC9;
   border-width:2px;
   border-style:solid;
   width:100%;
   height:80px; 
}

.footer_table
{
   background-color:#77ADC9;
   border-color:#77ADC9;
   border-width:0px;
   border-style:solid;
   width:100%;
   height:42px;
}
.main_div
{
   width:95%;
   height:450;
   padding-left:10px;
}  
</style>
<meta http-equiv="Refresh" content="5; url=index.jsp"><!-- Direct to main login page -->
    <title>BB RssReader-Logout</title>
</head>

<body  >
    <table align=center border=0 class="main_table" cellpadding=0 cellspacing=0>
    <tr ><td width="13" background="images/left-shdw.gif" style="height: 134px"></td>
    <td valign=top style="height:134px;">
    <table align=center border=0 class="header_table" cellpadding=0 cellspacing=0>
    <tr><td style="padding-left:5px;" align=center>
    <img src="images/uhcslogo4.jpg" border=0 />
    </td></tr></table> 
    <table align=center width=100%>
    <tr>
    <td align=left><a href="limimenu.jsp"><img src="images/home.gif" border=0 /></a></td>
    <td align=right><a href="logout.jsp"><img src="images/logout.jpg" border=0 width=40 height=40 /></a> </td>
    </tr>
    </table></td>
    <td background="images/right-shdw.gif" style="height:134px; width: 12px;"></td></tr>
    <tr><td width="13" background="images/left-shdw.gif"></td><td valign=middle>
    <table border=0 cellpadding=0 cellspacing=0 width="100%">
	<tr><td align=center valign=middle>
	
    <br><br><br><br>
    <table class=tblMessage align=center ><tr><td align=center> 
    <%
    session.invalidate(); //destroy all sessions
    %>
    <span class=textMessage>Have A Nice Day <br> Redirecting to Login Screen in 5 seconds...
    <br><a href="index.jsp" >Manually Reach The Login Page</a></span>
    </td></tr>
    </table>
    
    </td></tr></table>
	<asp:ContentPlaceHolder ID="footer" runat="server"></asp:ContentPlaceHolder>
    </td><td background="images/right-shdw.gif" style="width: 12px"></td></tr>
    <tr><td width="13" background="images/left-shdw.gif"></td><td valign=bottom>
    <table align=center border=0 class="footer_table" cellpadding=0 cellspacing=0>
    <tr><td valign=bottom><div align=left>
    <a href="http://mcs.cs.uh.edu" target=_blank alt="Wimi Contact"><img src="images/email.jpg" border=0 /></a>
    </div></td><td><div align=right style="padding-right:5px;">
    <a href="http://mcs.cs.uh.edu" target=_blank alt="Wimi Help"><img src="images/help.gif" border=0 /></a>
    </div></td></tr>
    </table> 
    </td><td background="images/right-shdw.gif" style="width: 12px">&nbsp;</td></tr>
    </table>
</body>
</html>