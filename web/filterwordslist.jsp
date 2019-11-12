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
        <%
        
          //  String word = request.getParameter("e");
            
          //  Class.forName("com.mysql.jdbc.Driver");
           //     Connection cont = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");
           //     Statement smt = cont.createStatement();
               // int  i = smt.executeUpdate("insert into admin values('"+word+"')");
           //       if(i!=0){
            
          //  response.sendRedirect("filterwordslist.jsp?msg=Action success");
               //   }
          //       else {
                
             //        //JOptionPane.showMessageDialog(null,"Error Ocuur..!");  
                   // response.sendRedirect("filterwordslist.jsp?msgr=Action fails");
            //     }
               %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter Words list</title>
    </head>
    <body bgcolor="#B3D1B3"><center><hr>
        <h1><font color=" Red" SIZE ="18">Filter Words List...!</font></h1><hr><br><br>
          <div align="left"><img src="images/admin.png" alt="" width="120" height="99" /></div>

   <%

    /*    if (request.getParameter("msg") != null) {
            out.println("<script>alert('Information Saved..!')</script>");
        }
   
        if (request.getParameter("msgr") != null) {
            out.println("<script>alert('fails')</script>");
        }
 */
    %>     
        <div>
           <table border="2">
               <tr style="color: blue">
                   <td>CAT</td>
                   <td>WORDS</td>
                   <td>UPDATE</td> 
                   <td>STATUS</td>
                                  </tr>
                    <%
        
 
                                     
        String CAT = null,WORDS = null;
       String getText = request.getParameter("text");
     
System.out.println(getText); 
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");     

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from admin"); 

while(rs.next()){
    CAT = rs.getString("cat");
    WORDS = rs.getString("word");



       %>   
               <tr style="color: yellow">
                   <td><%=CAT%></td>
               <form action="edit.jsp">
                   <td><input type="text" name="e" value="<%=WORDS%>" readonly/></td>
                   <td><input type="text" name="up" /></td>
                   <td><input type="submit"/></td>
                 </form>
                   <td>
                   
                  
                   <%

}                                     
%>
               </tr>
           </table>
           <div align="left"><a href="index.html"> <input type="submit" value="HomePage"></a>
               <a href="adminuser.jsp"> <input type="submit" value="Back"></a>
           </div><hr>
            </center>
      
    </body>
</html>
