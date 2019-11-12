 <%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Statement"%>

<%@page import="java.sql.Connection"%>

<%
   
String word = request.getParameter("e");
  
 String wordup = request.getParameter("up");
         
 System.out.println("word "+word);
       
   System.out.println("wordup "+wordup);
        //System.out.println("ID IS "+session.getAttribute("ID").toString());
       
            
          
  Class.forName("com.mysql.jdbc.Driver");
               
 Connection cont = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");
              
  Statement smt = cont.createStatement();
            
int  i = smt.executeUpdate("update admin set word = '"+wordup+"' where word = '"+word +"' ");
                  
if(i!=0)
{
 response.sendRedirect("filterwordslist.jsp?msg=Action success");
 
 
               }
                
else {
                
                     //JOptionPane.showMessageDialog(null,"Error Ocuur..!");  
                   
 response.sendRedirect("filterwordslist.jsp?msgr=Action fails");
            
    }
            
              
 %>