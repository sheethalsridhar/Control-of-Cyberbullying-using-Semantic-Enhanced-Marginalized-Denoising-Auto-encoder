<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<html>
<head>
</head>
<body>
<%
Thread.sleep(100);
ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("//");
		String paramname=null;
	     int id=0;
		String secondary=null,university=null,employee=null,image=null;
                System.out.println("jjjjjjjj"+(String)session.getAttribute( "id11" ));
		int a1=Integer.parseInt((String)session.getAttribute( "id11" ));
   		
                 File file1 = null;
			
		
		try {
			 
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("secondary"))
				{
					secondary=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("university"))
				{
					university=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("employee"))
				{
					employee=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("//"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            
			Connection con=databasecon.getconnection(); 

			PreparedStatement ps=con.prepareStatement("update reg set secondary=?,university=?,employee=?,image=? where id='"+a1+"'");
			    
       			ps.setString(1,secondary);
       			ps.setString(2,university);
				ps.setString(3,employee);
				ps.setString(4,image);
				
				
				
       if(f == 0)
			ps.setObject(4,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(4,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("userpage.jsp?message=success");
			}
			else
			{
				response.sendRedirect("userpage.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>