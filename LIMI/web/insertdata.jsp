<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*,javax.sql.*,javax.naming.*, edu.uh.cs.limi.unzip.*" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String lastname = session.getAttribute("patientname").toString();
            ArrayList parapair = (ArrayList) session.getAttribute("parapair");
            boolean patientexist = false;

            out.println("<h2>Step 1: Move the files to directory Wimipermanent</h2>");
            String path = application.getRealPath("/");
            String oldpath = path + "upload";
            String newpath = path + "wimipermanent//" + lastname;
            File objfile = new File(oldpath);
            File newobjfile = new File(newpath);
            boolean succ = newobjfile.mkdir();
            if (!succ) {
                out.println("The directory of patient " + lastname + " is already exist!");
                patientexist = true;
            }
             String[] filelist = objfile.list();
            for (int i = 0; i < filelist.length; i++) {
            File tempfile = new File(oldpath + "//" + filelist[i]);
            succ = tempfile.renameTo(new File(newpath + "//" + filelist[i]));
            if (!succ) {
            out.println("Failed to move " + filelist[i]);
            }
            }
            out.println("<h2>Step 2: Unzip the file</h2>");
            Unzip.extZipFileList(newpath + "//" + "Graphic_Output.zip", newpath);
            Unzip.extZipFileList(newpath + "//" + "Graphic_Output" + "//" + "MoviesToVisualize.zip", newpath + "//" + "Graphic_Output");
            Unzip.extZipFileList(newpath + "//" + "Graphic_Output" + "//" + "PicturesToVisualize.zip", newpath + "//" + "Graphic_Output");
            
            String imagepath = newpath + "//" + "Graphic_Output" + "//" + "PicturesToVisualize" ;
            String videopath = newpath + "//" + "Graphic_Output" + "//" + "MoviesToVisualize" ;
            
            objfile = new File(imagepath);
            filelist = objfile.list();
            for (int i = 0; i < filelist.length; i++) {
            File tempfile = new File(imagepath + "//" + filelist[i]);
            succ = tempfile.renameTo(new File(imagepath + "//" + "image"+Integer.toString(i+1)+".jpg"));
            
            }
            objfile = new File(videopath);
            filelist = objfile.list();
            for (int i = 0; i < filelist.length; i++) {
            File tempfile = new File(videopath + "//" + filelist[i]);
            succ = tempfile.renameTo(new File(videopath + "//" + "movie"+Integer.toString(i+1)+".swf"));
            
            }
            
            
            
            
            out.println("<h2>Step3: Update the database</h2>");

            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/limi");
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet res = null;
            String query = null;

            /* First we insert the data into the table patient, if not exists;
             *and at the same time we get the variable patientid */
            int patientid = -1;
            if (patientexist) {
                //patient are  in the database
                query = " select patientid from patient where lastname = " + "'" + lastname + "'";
                res = stmt.executeQuery(query);
                res.next();
                patientid = res.getInt(1);

            } else {
                //patient are not in the database
                query = "select count(*) from patient";
                res = stmt.executeQuery(query);
                res.next();
                if (res.getInt(1) == 0) {
                patientid = 1;
                } else {                
                    query = "select MAX(patientid) from patient";
                    res = stmt.executeQuery(query);
                    res.next();
                    patientid = res.getInt(1) + 1;
                }
                query = "INSERT INTO patient (patientid, lastname) VALUES (" + patientid + "," + "'" + lastname + "')";
                stmt.execute(query);
            }

            /*Second we insert the table study*/
            int studyid = -1;
            query = "select count(*) from study";
            res = stmt.executeQuery(query);
            res.next();
            if (res.getInt(1) == 0) {
                studyid = 1;
            } else {
                query = "select MAX(studyid) from study";
                res = stmt.executeQuery(query);
                res.next();
                studyid = res.getInt(1) + 1;
            }
            query = "INSERT INTO study (studyid, to_patientid) VALUES (" + studyid + "," + patientid + ")";
            stmt.execute(query);


            /* Next InsertParamsforStudy()*/
            String comments = new String();
            for (int i = 0; i < parapair.size(); i++) {
                String[] temp = (String[]) parapair.get(i);
                temp[1] = temp[1].replaceAll("'", "\\\\'");
                if (i == parapair.size() - 1) {
                    comments = temp[1];
                }
                query = "insert into ParamsInStudy(to_studyid,param_name,param_value) values( " +
                        studyid + ",'" + temp[0] + "', '" + temp[1] + "')";
                stmt.execute(query);
            }

            /* Then insertSeries() */
            int seriesid = -1;
            query = "select count(*) from series";
            res = stmt.executeQuery(query);
            res.next();
            if (res.getInt(1) == 0) {
                studyid = 1;
            } else {
                query = "select MAX(seriesid) from series";
                res = stmt.executeQuery(query);
                res.next();
                seriesid = res.getInt(1) + 1;
            }
            query = "insert into Series(seriesid,to_studyid,comments) values(" +
                    seriesid + "," + studyid + ",'" + comments + "')";
            stmt.execute(query);

            /* At last  insertImage */
            int imageid = -1;
            query = "select count(*) from image";
            res = stmt.executeQuery(query);
            res.next();
            if (res.getInt(1) == 0) {
                imageid = 0;
            } else {
                query = "select MAX(imageid) from image";
                res = stmt.executeQuery(query);
                res.next();
                imageid = res.getInt(1) ;
            }
            int numberofimages = 4;
            for (int i = 0; i < numberofimages; i++) {
                imageid++;
                imagepath = lastname+ "//Graphic_Output//PicturesToVisualize//image" + Integer.toString(i+1) + ".jpg";
                videopath = lastname+ "//Graphic_Output//MoviesToVisualize//movie"+ Integer.toString(i+1) + ".swf";
                query = "insert into Image(imageid,to_seriesid,imagepath,videopath)" +
                        " values(" + imageid + "," + seriesid + ",'" + imagepath + "','" + videopath + "')";
                stmt.execute(query);
            }   
        
        %>
    
    </body>
</html>
