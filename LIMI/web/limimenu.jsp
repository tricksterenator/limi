<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
 document.title='Limi Menu';
</script>
<%@ include file="checksession.jsp" %> 
<%@ include file="header.jsp" %> 
<script type="text/javascript">

/***********************************************
* Cool DHTML tooltip script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}


function ddrivetip(thetext){
if (ns6||ie){
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
tipobj.style.visibility="visible"
}
}


function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
}
}

document.onmousemove=positiontip
uptext='<b>This page is where u can upload your experiment results</b> <br> <image src=images/multipleUpload.jpg width=400>';
emtext='<b>This page is where u can insert datasets into the database</b> <br> <image src=images/extractmove.jpg width=400>';
dltext='<b>This page is where you can download the datasets</b> <br> <image src =images/downloadicon.JPG width = 400>';
srtext='<b>Search with multiple keywords to view a study</b> <br> <image src=images/WimiSearch.JPG width=400>';
vatext='<b>Displays all the Subjects</b> <br> <image src=images/viewall.jpg width=400>';
</script>
        <br /><br />
        <table align=center border=0>
        <tr>
        <td valign=top>
        <table align=center border=0 >
        <tr><td>
        <a href="multipleupload.jsp" onMouseover="ddrivetip(uptext)" onMouseout="hideddrivetip()" ><img border="0" src="images/upbutton.jpg"></a>
        </td></tr>
        <tr><td>
        <a href="extract_move.jsp" onMouseover="ddrivetip(emtext)" onMouseout="hideddrivetip()" ><img border="0" src="images/embutton.jpg"></a>
        </td></tr>
        <tr><td>
        <a href="search.jsp" onMouseover="ddrivetip(srtext)" onMouseout="hideddrivetip()" ><img border="0" src="images/sebutton.jpg"></a>
        </td></tr>                 
        <tr><td>
        <a href="viewall.jsp" onMouseover="ddrivetip(vatext)" onMouseout="hideddrivetip()" ><img border="0" src="images/vabutton.jpg"></a>
        </td></tr> 
		<tr><td>
        <a href="download.jsp" onMouseover="ddrivetip(dltext)" onMouseout="hideddrivetip()" style="visibility:hidden;"><img border="0" src="images/dlbutton.jpg"></a>
        </td></tr>        
        </table>
        </td>
        <td style="padding: 5px 5px 5px 5px; height: 400px; width: 400px;" valign=top>
        <div style="width:400 px; height:400 px;" id="tipobj"></div>
        </td>
        </tr>
        </table> 
<%@ include file="footer.jsp" %>    
    
       
    
    