<%@page import="java.awt.image.RescaleOp"%>
<%@page import="Mail.mailtoall"%>
<%@page import="java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<body>
<title>Word Insert Page</title>




  
       <% 
        try
                {
				
        int a1=(Integer)(session.getAttribute( "id" ));
	String a=request.getParameter("word");		
	        session.setAttribute("word",a);	  
	 
       Connection con=databasecon.getconnection();
        Statement st=con.createStatement();
        Statement stm=con.createStatement();
        String sqles="select * from reg where userid='"+c+"'";
        ResultSet ress=stm.executeQuery(sqles);
        if(ress.next())
        {
            response.sendRedirect("newuser.jsp?message=User Id alresdy Exist");
        }
        else
                       {
        String msg1="The user: "+c+" Created Account on our Social network if u like to join Kindly click in Find Friends to find ";
		 mailtoall mail=new mailtoall(c, "eswar", msg1);
        String sql="insert into reg(id,fname,sname,name,userid,remail,pass,gender,date,month,year) values ('"+a1+"','"+a+"','"+b+"','"+j+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"')";
		
        int x=st.executeUpdate(sql);
		if(x!=0){
                      
		response.sendRedirect("owner.jsp?message=Successfully Registered");
	
		}
				else{
		response.sendRedirect("newuser.jsp?message=fail");
		
		}
        con.close();
        st.close();
        }
               }
        catch(Exception e)
                {
        out.println(e);
		
        }
        %>
       
 </center>
  
        </td>
   
    </tr>
    </body>
  </table>
