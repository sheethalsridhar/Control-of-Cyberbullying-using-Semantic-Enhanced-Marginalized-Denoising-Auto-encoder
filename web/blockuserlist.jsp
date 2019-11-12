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
        <title>block msg user Table</title>
    </head>
    <body bgcolor="#B3D1B3"><center><hr>
        <h1><font color=" Red">Blocked Message User List...!</font></h1><hr><br><br>
          <div align="left"><img src="images/admin.png" alt="" width="120" height="99" /></div>

       
        <div>
           <table border="2">
               <tr style="color: blue">
                   <td>USER NAME</td>
                   <td>WORDS</td>
                   
               </tr>
                    <%
        
 
                                     
        String username = null,words = null;
       String getText = request.getParameter("text");
     
System.out.println(getText); 
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");     

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from buser"); 

while(rs.next()){
    username = rs.getString("user");
    words = rs.getString("statusa").replaceAll("%20", " ");
   




       %>   
               <tr style="color: red">
                   <td><%=username%></td>
                   <td><%=words%></td>
                                     <%

}                                     
%>
               </tr>
           </table><br><br>
               <a href="index.html"> <input type="submit" value="HomePage"></a>
               <a href="adminuser.jsp"> <input type="submit" value="Back"></a>
               <hr>
            </center>
       </div>
               
        </form>
    </body>
</html>
