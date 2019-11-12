<%-- 
    Document   : newjsp
    Created on : Oct 1, 2013, 6:24:03 PM
    Author     : ibn
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function check()
            {
                var a = document.f1.opn.value;
                var b = document.f1.t.value;
                if(a ==""){
                    alert("Plese enter Select catgeory..!!");
                   
                    return false;
                }
                if(b==""){
                    alert('Please enter your words');
                    return false;
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin Page</title>
    </head>

    <body bgcolor="#B3D1B3">
        <h1 align="center"><font size="+3">Cyberbulling
            </font></h1>
        <h1 align="center"><font size="+3"COLOR="RED">ADMIN PAGE</font></h1><hr>
        <div><img src="images/admin.png" alt="" width="120" height="99" /><br>
            <div id="menu">
			<ul>
				<li> <a href ="index.html">Logout</a></li>
                                <li><a href ="UserTablee.jsp">User List</a></li>
                                
<!--				<li><a href ="filterwordslist.jsp">Filter Words List</a></li>-->
				<li><a href ="blockuserlist.jsp">Blocked Users</a></li>
				
				<li><a href ="g1.jsp">Filter Performance</a></li>
			</ul>
		</div>
            
            
            
          
          <div style="position:absolute; right:500px; top:145px; left:550px; width: 625px; height: 421px;">
<!--            <form name="f1" action="foradmin.jsp" method="get" onsubmit="return check();"> 
                <h2>Word Category</h2>:
                <select name="opn" id="opn"><option value="ILLEGAL WORDS">Illegal Words</option>
                    <option value="BAD WORDS" selected>Bad Words</option>
                    <option value="RESTRICTED WORDS">Restricted words</option>

                </select>
                <h2>Words:</h2> <input type="text" name="text"id="t"><br><br>

                <input type="submit" value="Add">
                <input type="reset" name="text" value="Clear">-->
                <%
                int uid=0;
                int buid=0;
try
               {
    Connection conn=databaseconnection.databasecon.getconnection();
    String sql="select count(1) from reg";
    Statement stm=conn.createStatement();
    ResultSet rs=stm.executeQuery(sql);
    if(rs.next())
               {
        uid=rs.getInt(1);
    }
    session.setAttribute("guid",uid);
    System.out.println("Eswar==="+uid);
    String sql1="select distinct count(1) from buser";
    Statement stm1=conn.createStatement();
    ResultSet rs1=stm1.executeQuery(sql1);
    if(rs1.next())
               {
        buid=rs1.getInt(1);
    }
    session.setAttribute("gbuid",buid);
    System.out.println("Eswar==="+buid);
}catch(Exception es)
                  {
                   es.printStackTrace();
               }
                    if (request.getParameter("msg") != null) {
                        out.println("<script>alert('Information Saved..!')</script>");
                    }

                    if (request.getParameter("msgr") != null) {
                        out.println("<script>alert('fails')</script>");
                    }
                %>
             

                
            

            </form>
        </div><BR>
        <HR>
    </body>
</html>
