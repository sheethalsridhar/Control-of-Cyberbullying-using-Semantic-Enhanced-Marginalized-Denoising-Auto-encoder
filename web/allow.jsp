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
//    String word1=request.getParameter("word");
//    System.out.println("word======="+word1);
    String word=request.getParameter("word").replace(" ", "%20");
    String cuser=request.getParameter("cuser");
    System.out.println("Blocked user====="+buser);
    System.out.println("Words====="+word);
    System.out.println("Current user====="+cuser);
    
    try
    {
     Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");
//     PreparedStatement ps=con.prepareStatement("insert into update_");
////     PreparedStatement stm=con.prepareStatement("update update_ set allow_=? ,bad_='confirm' where user=? and statusa=? and permission=? ");
//     stm.setString(1,"allow");
//     stm.setString(2,buser);
//     stm.setString(3,word);
//     stm.setString(4,cuser);
//     int x=stm.executeUpdate();
     Statement st=con.createStatement();
     Statement st1=con.createStatement();
   int x=st.executeUpdate("insert into update_ values('"+buser+"','"+word+"','"+cuser+"',now())");
     if(x>0)
     {
        int i= st1.executeUpdate("delete from notific where cuser='"+cuser+"' and buser='"+buser+"' and wor='"+word+"'");
         response.sendRedirect("status.jsp?msg=allowed");
     }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>