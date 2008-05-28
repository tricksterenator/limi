<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
            String myid = request.getParameter("fd");

            String path = application.getRealPath("/");
            path = path + "upload";
            File dir = new File(path);
	    String[] filelist = dir.list();
            String filename = null;
            for (int i = 0; i < filelist.length; i++) {
                if (filelist[i].endsWith(".txt")) {
                        filename = filelist[i];
                        break;
                }
	   }
           int ind1 = filename.indexOf("_", 1);
           String patientname = filename.substring(0, ind1);
           int ind2 = filename.indexOf("_", ind1+1);           
           String file_data = filename.substring(ind1+1, ind2);
           ind1 = filename.indexOf("_", ind2+1);
           String file_time = filename.substring(ind2+1, ind1);
           ind2 = filename.indexOf(".txt");
           String file_author = filename.substring(ind1+1,ind2);
           session.setAttribute("patientname", patientname);
           
            BufferedReader in = new BufferedReader(new FileReader(path + "//" + myid));
            String line = new String();
//int i = 0;
            Collection itempair = new ArrayList();
            while ((line = in.readLine()) != null) {
                if (line.startsWith("%") || line.length() == 0) {
                    continue;
                }

                int index = line.indexOf("=");
                String[] pp = new String[2];
                //String p_name =  line.substring(0, index).trim();
                pp[0] = line.substring(0, index).trim();
                //String p_value = line.substring(index+1, line.length()-1).trim();
                pp[1] = line.substring(index + 1, line.indexOf(";")).trim();
                //String name = "name"+Integer.toString(i);
                //String value = "value" + Integer.toString(i);

                //pageContext.setAttribute(name, p_name);       
                //if(p_value.startsWith("'")&&!p_value.endsWith("'")){
                if (pp[1].startsWith("'") && !pp[1].endsWith("'")) {
                    while ((line = in.readLine().trim()) != null) {
                        if (line.endsWith(";") && line.indexOf("'") != -1) {
                            pp[1] = pp[1] + line.substring(0, line.length() - 1).trim();
                            break;  //break while loop
                        }// end if
                        pp[1] = pp[1] + " " + line.trim();
                    }//end while             
                } // end if       
                itempair.add(pp);
            //itempair.add();
            //pageContext.setAttribute(value, p_value);             
            //i++;        
            }
            session.setAttribute("parapair", itempair);
            in.close();
// pageContext.setAttribute("num", Integer.toString(i));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 
        <link href="CSS/2.css" rel="stylesheet" type="text/css" />
        <script src="js/prototype.js" type="text/javascript" ></script>
        <script src="js/my.js" type="text/javascript" ></script>
        <style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
        </style>
</head>
    <body>
        <table width="100%" border="0">
          <tr>
            <td width="29%"><input name="Proceed to Insert" type="button" style="border-color: Navy; color: Lavender; background-color: rgb(128, 128, 255); font-weight: bold; width: 136px;" onClick="ConfirmInsertData_Click()" value="Proceed to Insert" ></td>
            <td width="71%"><font color="blue">Parameters for subjects: ${patientname} </font></td>
          </tr>
        </table>
        <table width="100%" border="1" bordercolor="#CCCCFF">
            <tr>
                <td bgcolor="#0000FF"><div align="center" class="STYLE1">parameter_name</div></td>
                <td bgcolor="#0000FF"><div align="center" class="STYLE1 STYLE1">parameter_value</div></td>
            </tr>
            <c:forEach var="parapair" items="${parapair}"> 
                <tr> 
                    <td><c:out value="${parapair[0]}"/></td> 
                    <td><c:out value="${parapair[1]}"/></td> 
                </tr> 
            </c:forEach> 
    </table>
    </body>
</html>
