<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>
<%
int fid=Integer.parseInt(request.getParameter("fid"));
int cid=Integer.parseInt(session.getAttribute("id").toString());
 Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
   int i=st.executeUpdate("delete from request where id='"+cid+"' and fid='"+fid+"'");
   if(i>0)
   {
   int i1=st.executeUpdate("delete from request where id='"+fid+"' and fid='"+cid+"'");
   if(i1>0)
   {
       response.sendRedirect("userpage.jsp?m=fail");
   }
   }
%>