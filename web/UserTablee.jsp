<%-- 
    Document   : UserTablee
    Created on : Oct 2, 2013, 10:24:37 AM
    Author     : ibn
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Table</title>
    </head>
     <body bgcolor="#B3D1B3"><center><hr>
        <h1><font color=" Red">User Details...!</font></h1><hr><br><br>
          <div align="left"><img src="images/admin.png" alt="" width="120" height="99" /><BR><BR>
          <a href="index.html"> <input type="submit" value="HomePage"></a><BR><BR>
               <a href="adminuser.jsp"> <input type="submit" value="Back"></a><BR><BR>
          </div>

       
        <div style="position:absolute; right:650px; top:180px; left:5500 0px; width: 325px; height: 421px;">
            <table border="2">
               <tr style="color: blue">
                   <td>FIRST NAME</td>
                   <td>SUR NAME</td>
                   <td>NAME</td>
                   <td>USER ID</td>
                   <td>GENDER</td>
                   <td>OCCUPATION</td>
               </tr>
                    <%
        
 
                                     
        String fname = null,sname = null,name = null,userid = null,gender = null,employee = null;
       String getText = request.getParameter("text");
     
System.out.println(getText); 
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");     

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from reg"); 

while(rs.next()){
    fname = rs.getString("fname");
    sname = rs.getString("sname");
    name = rs.getString("name");
    userid = rs.getString("userid");
    gender = rs.getString("gender");
    employee = rs.getString("employee");




       %>   
               <tr style="color: red">
                   <td><%=fname%></td>
                   <td><%=sname%></td>
                   <td><%=name%></td>
                   <td><%=userid%></td>
                   <td><%=gender%></td>
                   <td><%=employee%></td>
                   <%

}                                     
%>
               </tr>
           </table>
               </div>
           
               
               
           
       
                             
        </form>
        
    </body>
    
     </html>
