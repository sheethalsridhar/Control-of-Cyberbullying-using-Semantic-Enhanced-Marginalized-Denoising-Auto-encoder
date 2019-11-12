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
	    String str = (String)session.getAttribute("str1");
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
        	   
		String relationship=null,fgroup=null;
		String rid=(String)(session.getAttribute("rid"));
	
   		  File file1 = null;
			
		
		try {
			 
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
			
				if(paramname.equalsIgnoreCase("relationship"))
				{
					relationship=multi.getParameter(paramname);
				}
			
				if(paramname.equalsIgnoreCase("fgroup"))
				{
					fgroup=multi.getParameter(paramname);
				}
		
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
			PreparedStatement ps=con.prepareStatement("update request set relationship=?,fgroup=? where id='"+rid+"' and fid='"+fid+"'");
			    
       			
       			ps.setString(1,relationship);
			
				ps.setString(2,fgroup);
										
				
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
				response.sendRedirect("friends.jsp?message=success");
			}
			else
			{
				response.sendRedirect("friends.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>