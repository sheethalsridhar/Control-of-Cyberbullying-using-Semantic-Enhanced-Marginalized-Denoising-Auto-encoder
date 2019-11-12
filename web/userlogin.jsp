<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>
<head>
<title>Cyberbulling</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name=null;
session.setAttribute("userid",userid);
session.setAttribute("pass",pass);

try{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");
	st = con.createStatement();
	String qry ="select * from reg where  userid='"+userid+"' AND pass='"+pass+"'"; 
	rs = st.executeQuery(qry);
	if(rs.next()){
            
	name=rs.getString("name");
        String user=rs.getString("fname");
        System.out.println("user name==="+user);
	session.setAttribute("name",name);
        String qry1="select count(*) from buser where user='"+user+"'";
        ResultSet rs34=st.executeQuery(qry1);
        rs34.next();
            int c=rs34.getInt(1);
            System.out.println("count==="+c);
            if(c>=10)
            {
                out.println("your account is blocked permently");
            }
        else
        {
	response.sendRedirect("userpage.jsp?m3=done");
	
	}
        }
	else{
		out.println("Enter correct username, password");		
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


