<script language="JavaScript">   

function getFlashMovieObject(movieName)
{
  if (window.document[movieName]) 
  {
    return window.document[movieName];
  }
  if (navigator.appName.indexOf("Microsoft Internet")==-1)
  {
    if (document.embeds && document.embeds[movieName])
      return document.embeds[movieName]; 
  }
  else // if (navigator.appName.indexOf("Microsoft Internet")!=-1)
  {
    return document.getElementById(movieName);
  }
}

function StopFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	flashMovie.StopPlay();
}

function PlayFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	flashMovie.Play();
	//embed.nativeProperty.anotherNativeMethod();
}

function RewindFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	flashMovie.Rewind();
}

function NextFrameFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	// 4 is the index of the property for _currentFrame
	var currentFrame=flashMovie.TGetProperty("/", 4);
	var nextFrame=parseInt(currentFrame);
	if (nextFrame>=10)
		nextFrame=0;
	flashMovie.GotoFrame(nextFrame);		
}


function ZoominFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	flashMovie.Zoom(90);
}

function ZoomoutFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	flashMovie.Zoom(110);
}


function SendDataToFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	flashMovie.SetVariable("/:message", document.controller.Data.value);
}

function ReceiveDataFromFlashMovie()
{
	var flashMovie=getFlashMovieObject("myFlashMovie");
	var message=flashMovie.GetVariable("/:message");
	document.controller.Data.value=message;
}

</script> 
 <%
 	String videopath;
 	if(request.getParameter("videopath")==null)
 	{
 		return;
 	}else
 	{
 		videopath=request.getParameter("videopath");
 	}
 %>

<!---Main Table To Set Frame--->
<table align="center" border=0 cellpadding=0 cellspacing=0 align="left">
<tr>
<td style="width: 25px;height: 25px;"><img src="images/lefttop.gif"></td>
<td background="images/topbck.gif"></td>
<td style="width: 25px;height: 25px;"><img src="images/righttop.gif"></td>
</tr>
<tr>
<td style="width: 25px;" background="images/leftbck.gif"></td>
<td style="padding-bottom: 5px;">
<!----- This is the place for swf player ----->
<table align=center style="border-width: 3px; border-color: #4C94D7; border-style:solid;"><tr><td>
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0"
 id="myFlashMovie" width=400 height=400>
 <%
 	out.print("<param name=movie value='"+videopath+"' >"); 		
 %>
  
 <param name=quality value=high> 
 <param name=play value=false> 
 <param name=bgcolor value=#FFFFFF> 
 <embed play=false swliveconnect=true name=myFlashMovie width=400 height=400 src='<% out.print(videopath); %>' quality=high bgcolor=#FFFFFF type=application/x-shockwave-flash pluginspage=http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash></embed >
 </object >
 </td></tr></table>
 
 <!----- This is the place for swf player ----->
</td>
<td style="width: 25px;" background="images/rightbck.gif"></td>
</tr>
<tr >
<td style="width: 25px;" background="images/leftbck.gif"></td>
<td style=" padding-top: 5px; ">
<table background="images/backgr.gif" border=0 align=center style="height: 32px; width: 150px;" cellpadding=0 cellspacing=0>
 <tr><td align=center>
 <a href="javascript:PlayFlashMovie();"><img src="images/play.gif" border=0 /></a>
 </td>
 <td align=center>
 <a href="javascript:StopFlashMovie();"><img src="images/pause.gif" border=0 /></a>
 </td>
 <td align=center>
 <a href="javascript:ZoominFlashMovie();"><img src="images/zoom_in.gif" border=0 /></a>
 </td>
 <td align=center>
 <a href="javascript:ZoomoutFlashMovie();"><img src="images/zoom_out.gif" border=0 /></a>
 </td></tr>
 </table></td>
<td style="width: 25px;" background="images/rightbck.gif"></td>
</tr>

<tr>
<td style="width: 25px;height: 25px;"><img src="images/leftbottom.gif"></td>
<td background="images/bottombck.gif"></td>
<td style="width: 25px;height: 25px;"><img src="images/rightbottom.gif"></td>
</tr>
</table>
  