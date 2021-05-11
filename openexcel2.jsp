<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.awt.Desktop"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String filename = "D:\\project\\Parents.xlsx";  


File file = new File("D:\\project\\Parents.xlsx");   
if(!Desktop.isDesktopSupported())//check if Desktop is supported by Platform or not  
{  
System.out.println("not supported");  
return;  
}  
Desktop desktop = Desktop.getDesktop();  
if(file.exists())         //checks file exists or not  
desktop.open(file);              //opens the specified file  
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>