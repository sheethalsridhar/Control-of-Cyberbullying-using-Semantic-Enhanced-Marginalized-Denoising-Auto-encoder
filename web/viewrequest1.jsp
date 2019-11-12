<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Personalized Image Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>

<%


		String str = request.getParameter("id");
		session.setAttribute("str",str);
		String[] temp;
 		String delimiter = ",";
		
 		temp = str.split(delimiter,5);
		for(int i =0; i < temp.length ; i++){
		}
				int id=Integer.parseInt((temp[0]));
				String name = temp[1];
				int fid=Integer.parseInt((temp[2]));
				session.setAttribute("fid",fid);
				String fname = temp[3];
				session.setAttribute("fname",fname);
        	    String status = temp[4]; 
ResultSet rs=null;
PreparedStatement psmt1=null;


java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

try{

Connection con=databasecon.getconnection();

String sql=null;

psmt1=con.prepareStatement("insert into request(id,name,fid,fname,status,relationship,fgroup) values(?,?,?,?,?,?,?)");
psmt1.setInt(1,id);
psmt1.setString(2,name);
psmt1.setInt(3,fid);
psmt1.setString(4,fname);
psmt1.setString(5,status);
psmt1.setString(6,"Null");
psmt1.setString(7,"Null");
int s = psmt1.executeUpdate();
response.sendRedirect("viewrequest2.jsp?message=success");

con.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>

</body>
</html>