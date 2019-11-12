<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<html>
<head>
</head>
<body>
<%

	    
		String str = (String)session.getAttribute("str");
		
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
		
		try {
	

            
			Connection con=databasecon.getconnection(); 
			PreparedStatement ps=con.prepareStatement("update request set status=? where id='"+fid+"' and fid='"+id+"'");
			    
       			
       			ps.setString(1,status);

										
				
      /* if(f == 0)
			ps.setObject(4,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(4,fs1,fs1.available());
		} */	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("viewrequest3.jsp?message=success");
			}
			else
			{
				response.sendRedirect("viewrequest3.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>