<%-- 
    Document   : foradmin
    Created on : Oct 2, 2013, 11:06:17 AM
    Author     : ibn
--%>

<%@page import="java.io.FileWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>For admin   </title>
    </head>
    <body>
        <%
        String cat = request.getParameter("opn");
            String word = request.getParameter("text");
//           String fname="C:\\rajashekar\\projects\\60\\CODE\\CODE\\word.txt";
//            FileWriter fw = new FileWriter(fname,true); //the true will append the new data
//    fw.write(cat+word+"\n");//appends the string to the file
//    fw.close();
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");
                Statement st = con.createStatement();
                int  i = st.executeUpdate("insert into admin values('"+cat+"','"+word+"')");
                  if(i!=0){
            
            response.sendRedirect("adminuser.jsp?msg=Action success");
                  }
                   else {
                
                     //JOptionPane.showMessageDialog(null,"Error Ocuur..!");  
                     response.sendRedirect("adminuser.jsp?msgr=Action fails");
                 }
                %>
</html>
