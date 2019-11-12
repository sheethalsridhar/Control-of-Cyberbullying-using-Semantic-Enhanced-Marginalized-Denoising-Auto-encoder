<%-- 
    Document   : msg
    Created on : Oct 3, 2013, 4:12:50 PM
    Author     : ibn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
  <body>
<%
String gg = request.getQueryString();
session.setAttribute("ll", gg);
%>
<SCRIPT>
var msg = "Bad Words Filtering ?? ";

if (confirm(msg)) 
    location.replace("forblockmsg1.jsp");
else
    location.replace("status.jsp");

</SCRIPT>
    

    </body>
</html>
