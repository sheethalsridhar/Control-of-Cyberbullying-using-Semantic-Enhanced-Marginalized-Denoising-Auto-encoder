<%@ page language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
try
{
  Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
   String name = null;
   String userid = request.getParameter("userid");
   String pass = request.getParameter("pass");
   String type=request.getParameter("type");
      
   String s = "select userid,pass,type from reg where userid='"+userid+"' and pass='"+pass+"' and type='"+type+"'";
   
   ResultSet rs = st.executeQuery(s);
   
   if(rs.next())
   {
   session.setAttribute("userid",rs.getString(1));
   if(type.equals("Owner"))
   {
   %>
   
   <jsp:forward page="userpage.jsp"/>
   
   <%
   }
   if(type.equals("Contributor"))
   {
   %>
   
   <jsp:forward page="userpage.jsp"/>
   
   <%
   }
   if(type.equals("Stakeholder"))
   {
   %>
   
   <jsp:forward page="userpage.jsp"/>
   
   <%
   }
   if(type.equals("Disseminator")||type.equals("Disseminator"))
   {
   %>
   
   <jsp:forward page="userpage.jsp"/>
   
   <%
   }
   }
   else
   out.print("Please check your login credentials");
   }
   
   catch(Exception x)
   {
   out.println(x);
   }
   %>