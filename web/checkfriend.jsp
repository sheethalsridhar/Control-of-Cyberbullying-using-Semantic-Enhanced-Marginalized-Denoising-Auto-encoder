<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
 String name = null,userid=null,id=null,fname=null;
 String rid=null; 
 int fid1=0;
try{

  
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 
   //fname=(String)session.getAttribute("fname");
   //sname=(String)session.getAttribute("sname");
   userid=(String)session.getAttribute("userid");
  
   String s = "select * from request";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   response.sendRedirect("friends.jsp");
   
   }
   else
     response.sendRedirect("findfriend.jsp");
  
  		
		
		}
catch(Exception ex)
	{
		System.out.println(ex);
	}
	
 
  %>

					



