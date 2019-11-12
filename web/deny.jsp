<%-- 
    Document   : allow
    Created on : Feb 27, 2016, 8:53:57 AM
    Author     : Hp
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String buser=request.getParameter("buser");
   String word=request.getParameter("word").replace(" ", "%20");
    String cuser=request.getParameter("cuser");
    try
    {
     Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");
////     PreparedStatement stm=con.prepareStatement("update update_ set allow_=? ,bad_='confirm' where user=? and statusa=? and permission=? ");
//     stm.setString(1,"Deny");
//     stm.setString(2,buser);
//     stm.setString(3,word);
//     stm.setString(4,cuser);
//     //int x=stm.executeUpdate();
//     int x=stm.executeUpdate();
     Statement st1=con.createStatement();
      int i= st1.executeUpdate("delete from notific where cuser='"+cuser+"' and buser='"+buser+"' and wor='"+word+"'");
     if(i>0)
     {
         response.sendRedirect("status.jsp?msg=denyied");
     }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>