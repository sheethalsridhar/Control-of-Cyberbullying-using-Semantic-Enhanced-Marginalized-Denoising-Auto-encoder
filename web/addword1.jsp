
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*"%>
<%
String word=request.getParameter("bword");
String word1="\n"+word;
//BufferedOutputStream bw=new BufferedOutputStream(new FileOutputStream("D:\\project\\new code1\\new code\\find.txt",true));
FileWriter fw=new FileWriter("D:\\project\\new code1\\new code\\find.txt",true);
fw.write("\r\n"+word);
fw.close();
response.sendRedirect("adminuser.jsp?m=done");

%>