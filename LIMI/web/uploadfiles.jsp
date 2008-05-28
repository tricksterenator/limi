<%@ page import="java.io.*"  %>
<%

String contentType = request.getContentType();
out.println("Upload result:<br>");
out.println(getServletContext().getRealPath(request.getRequestURI()));
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
{	
	DataInputStream in = new DataInputStream(request.getInputStream());
	int formDataLength = request.getContentLength();

	byte dataBytes[] = new byte[formDataLength];
	int byteRead = 0;
	int totalBytesRead = 0;
	while (totalBytesRead < formDataLength) 
	{
		byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
		totalBytesRead += byteRead;
	}
	
	String target_encoding = "ISO-8859-1";
	String file = new String(dataBytes);	
	String uploadDir = getServletContext().getRealPath("upload/");
	String saveFile = file.substring(file.indexOf("filename=\"") + 10);
	saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
	saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));	
	saveFile = new String(saveFile.getBytes(target_encoding),"UTF-8");	
	saveFile = uploadDir+"\\"+saveFile;	

	int lastIndex = contentType.lastIndexOf("=");
	String boundary = contentType.substring(lastIndex + 1,contentType.length());
	
	int pos;
	pos = file.indexOf("filename=\"");

	pos = file.indexOf("\n", pos) + 1;

	pos = file.indexOf("\n", pos) + 1;

	pos = file.indexOf("\n", pos) + 1;


	int boundaryLocation = file.indexOf(boundary, pos) - 4;
	int startPos = ((file.substring(0, pos)).getBytes()).length;
	int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

	
	FileOutputStream fileOut = null;
	try
	{
		fileOut = new FileOutputStream(saveFile);
	}
	catch(Exception e)
	{
		out.println("<br>Error creating file:"+e.getMessage());
	}
	
	//fileOut.write(dataBytes);
	if(fileOut != null)
	{
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
		out.println("<br>File " +saveFile+" uploaded sucefully.");
	}
	else
		out.println("<br>Error while saving file " +saveFile);
			
	
}
else
	out.println("No files sent. Script is OK!"); // Say to Flash that script exists and can receive files.
%>