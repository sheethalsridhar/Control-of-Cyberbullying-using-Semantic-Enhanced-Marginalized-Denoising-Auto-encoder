<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>
<%@ page import="java.io.*"%>
		<%
		String pid1 =request.getParameter("id1");
		String id=(String)(session.getAttribute("id"));
		String name=(String)session.getAttribute("name");
		int pid=0;
 Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String sql="select max(id) from view ";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		if(rs2.next())
		{
		if(rs2.getInt(1)==0)
		pid=1;
		else
		pid=rs2.getInt(1)+1;
		session.setAttribute( "pid", pid );
		System.out.println(pid);
		}

		}
catch(Exception ex)
	{
		System.out.println(ex);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
  Blob image = null;

Connection con1 = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;

try {

Class.forName("com.mysql.jdbc.Driver");

con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");

stmt = con1.createStatement();

rs = stmt.executeQuery("select image from view where id = '"+pid1+"'");

if (rs.next()) {

image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());
	try{
		Connection con=databasecon.getconnection();
		PreparedStatement ps=con.prepareStatement("insert into view(id,image,uid,name)  values(?,?,?,?)");
				ps.setInt(1,pid);
       			ps.setBlob(2,image);
				ps.setInt(3,Integer.parseInt(id));
				ps.setString(4,name);
				int x=ps.executeUpdate();
				response.sendRedirect("userpage1.jsp?message=success");
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}


}
} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {

rs.close();

stmt.close();

con1.close();

} catch (SQLException e) {

e.printStackTrace();

}

}
  %>

