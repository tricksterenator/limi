
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
    String myid = request.getParameter("text");
   
    String [] st = myid.split(" ");
    session.setAttribute("st1",st[0]);
    session.setAttribute("st2",st[1]);    
%>

<sql:query var="counsSubjRs" maxRows="1" dataSource="jdbc/IFPWAFCAD">
SELECT s.age, s.studyid, s.to_patientid, c.comments
FROM study as s, series as c
WHERE c.to_studyid = s.studyid
AND s.to_patientid = ? 
<sql:param value="${st1}"/>
</sql:query>

<c:set var="counsSubj" scope="request" value="${counsSubjRs.rows[0]}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">${counsSubj.comments} </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">{placeholder}</span></td>
                </tr>
                <tr>
                    <td><strong>Counselor: </strong></td>
                    <td>{placeholder}
                        <br>
                        <span style="font-size:smaller; font-style:italic;">
                        member since: {placeholder}</span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Contact Details: </strong></td>
                    <td><strong>email: </strong>
                        <a href="mailto:{placeholder}">{placeholder}</a>
                        <br><strong>phone: </strong>{placeholder}
                    </td>
                </tr>
            </tbody>
        </table>
        
        
        
    </body>
</html>
