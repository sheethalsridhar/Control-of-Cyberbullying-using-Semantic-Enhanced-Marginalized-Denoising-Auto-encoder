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
		String user=null,statusa=null,statusb=null,statusc=null,relationship=null,fgroup=null;
		int pid=(Integer)(session.getAttribute("pid"));
   		  File file1 = null;
			
		
		try {
			 
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("user"))
				{
					user=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("statusa"))
				{
					statusa=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("relationship"))
				{
					relationship=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("statusb"))
				{
					statusb=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("fgroup"))
				{
					fgroup=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("statusc"))
				{
					statusc=multi.getParameter(paramname);
				}
				
				}
                        if(statusa.equalsIgnoreCase("allow"))
                        {
				session.setAttribute("user",user);
                        }
                        else
                        {
                            session.setAttribute("user","0");
                        }
		/*	int f = 0;
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
			String fPath = context.getRealPath("\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null; */
            
			Connection con=databasecon.getconnection(); 
			PreparedStatement ps=con.prepareStatement("update view set user=?,statusa=?,relationship=?,statusb=?,fgroup=?,statusc=? where id='"+pid+"'");
			    
       			ps.setString(1,user);
				ps.setString(2,statusa);
       			ps.setString(3,relationship);
				ps.setString(4,statusb);
				ps.setString(5,fgroup);
				ps.setString(6,statusc);						
				
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
				response.sendRedirect("userpage3.jsp?message=success");
			}
			else
			{
				response.sendRedirect("userpage3.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>