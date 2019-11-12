<%@page import="java.awt.image.RescaleOp"%>
<%@page import="Mail.mailtoall"%>
<%@page import="java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>

<%
String uname=request.getParameter("userid");
 Connection con=databasecon.getconnection();
        Statement st=con.createStatement();
        Statement stm=con.createStatement();
        String sqles="select * from reg where userid='"+uname+"'";
        ResultSet ress=stm.executeQuery(sqles);
        if(ress.next())
        {
            String pass=ress.getString("pass");
            String mesage="you`r Login Password is:"+pass;
             mailtoall mail=new mailtoall(uname, " password", mesage);
            response.sendRedirect("index.html?m34=check ur email");
        }



%>