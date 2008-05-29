<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
 document.title='Limi Multiple Upload';
</script>
  <script language="JavaScript">
	
	function mysubmit(type)
	{
		
		if(type=='flash')
		{
			var Flash;
			if(document.embeds && document.embeds.length>=1 && navigator.userAgent.indexOf("Safari") == -1)
				Flash = document.getElementById("EmbedFlashFilesUpload");
			else
				Flash = document.getElementById("FlashFilesUpload");		
			Flash.SetVariable("uploadUrl", "uploadfiles.jsp"); 
			Flash.SetVariable("SubmitFlash", ""); 
		}
		else
		{
			var FormObj = document.getElementById("myform");
			FormObj.action = "uploadfiles.jsp";
			return true;
		}
	}
  </script>


<%@ include file="checksession.jsp" %> 
<%@ include file="header.jsp" %>
<span style="color:RoyalBlue;font-size:Larger;font-weight:bold;">LIMI UPLOAD MANAGER</span><br /><br />
<OBJECT id="FlashFilesUpload" codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
		width="450" height="350" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" VIEWASTEXT>
		<!-- Replace symbols " with the &quot; at all parameters values and 
		symbols "&" with the "%26" at URL values or &amp; at other values!
		The same parameters values should be set for EMBED object below. -->
	<PARAM NAME="FlashVars" VALUE="uploadUrl=uploadfiles.jsp
	&redirectUploadUrl=result.jsp">
	<!--PARAM NAME="BGColor" VALUE="#F8F6E6"-->
        <PARAM NAME="BGColor" VALUE="#FFFFFF">
	<PARAM NAME="Movie" VALUE="ElementITMultiPowUpload1.7.swf">
	<PARAM NAME="Src" VALUE="ElementITMultiPowUpload1.7.swf">
	<PARAM NAME="WMode" VALUE="Window">
	<PARAM NAME="Play" VALUE="-1">

	<PARAM NAME="Loop" VALUE="-1">
	<PARAM NAME="Quality" VALUE="High">
	<PARAM NAME="SAlign" VALUE="">
	<PARAM NAME="Menu" VALUE="-1">
	<PARAM NAME="Base" VALUE="">
	<PARAM NAME="AllowScriptAccess" VALUE="always">
	<PARAM NAME="Scale" VALUE="ShowAll">
	<PARAM NAME="DeviceFont" VALUE="0">
	<PARAM NAME="EmbedMovie" VALUE="0">	    
	<PARAM NAME="SWRemote" VALUE="">

	<PARAM NAME="MovieData" VALUE="">
	<PARAM NAME="SeamlessTabbing" VALUE="1">
	<PARAM NAME="Profile" VALUE="0">
	<PARAM NAME="ProfileAddress" VALUE="">
	<PARAM NAME="ProfilePort" VALUE="0">
	
	<!-- Embed for Netscape,Mozilla/FireFox browsers support. Flashvars parameters are the same.-->
		<!-- Replace symbols " with the &quot; at all parameters values and 
		symbols "&" with the "%26" at URL values or &amp; at other values! -->
	<!--embed bgcolor="#F8F6E6" id="EmbedFlashFilesUpload" src="ElementITMultiPowUpload1.7.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"	type="application/x-shockwave-flash" width="450" height="350" flashvars="uploadUrl=uploadfiles.jsp
	&redirectUploadUrl=result.jsp">
	</embed-->
         
         <embed bgcolor="#FFFFFF" id="EmbedFlashFilesUpload" src="ElementITMultiPowUpload1.7.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"	type="application/x-shockwave-flash" width="450" height="350" flashvars="uploadUrl=uploadfiles.jsp
	&redirectUploadUrl=result.jsp">
	</embed>

  </OBJECT>
<%@ include file="footer.jsp" %>