<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
   String name = null,userid=null,id=null;
try{


   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();

   userid=(String)session.getAttribute("userid");
  
   String s = "select id,name,userid from reg where userid='"+userid+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   name=rs.getString(2);
  
   userid=rs.getString(3);
 
  session.setAttribute("id",id);
   
   }
   else
   out.print("Please check your login credentials");
  
   
  %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Cyberbulling</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
<script language="JavaScript">
function validation()
{
var a = document.f1.relationship.value;

if(document.f1.relationship.selectedIndex==0)
{
alert("Please select The relationship ");
document.f1.relationship.focus();
return false;
}
}
</script>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		
    <h1 align="center"><font size="+3">Cyberbulling
      </font></h1>
		
	</div>
	
</div>
 
 

<div class='cssmenu'>
<ul>
   <li class='active '><a href="userpage.jsp"><span>HomePage</span></a></li>
 
 
   
   <li><a href="index.html"><span>Logout</span></a></li>
 
</ul>
</div>
<div id="page">
<h2>Welcome!&nbsp; 
       <font color="Navy"><font size="5"> <%=name%></font></font>
        </h2>
		<div><img src="viewimage.jsp?id=<%=id%>" alt="" width="120" height="99" /></div>
		<%
 
}
catch(Exception e)
{
System.out.println(e);
}
%>
	<div id="leftbar" class="sidebar">
		<ul>
			<li>
				
				<ul>
					<br><br>
                   <li><a href="friends.jsp"><font color="Blue" size="3">Find Friends</font></a></li>
		<li><a href="viewrequest.jsp"><font color="Blue" size="3">ViewFriendRequest</font></a></li>
        
		<li><a href="upload.jsp"><font color="Blue" size="3">Share Photo</font></a></li>
	    <li><a href="holder.jsp"><font color="Blue" size="3">FriendsList</font></a></li>
				</ul>
			</li>
			
			
			
		</ul>
	</div>
			
	
	</div>

<br><br>

	<div id="content">
	<div style="position:absolute; left:400px; top:240px;"><font color="Blue" size="5"><font color="red"> 
    View FriendList</font></font></div>
	<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
	<div style="position:absolute; left:400px; top:325px; width: 358px; height: 166px;">
		
		<fieldset>
      
    <legend><font color="Blue"><strong><font size="4">View</font></strong></font></legend>
		
		<form name="f1" action="holder1.jsp" method="post">
		
		<table width="188" height="121" align="center">
		
			
			<tr><td height="57">
				<select name="relationship">
					<option value="select">------Relationship------</option>
					<option value="Friends">Friends</option>
					<option value="Family">Family</option>
				</select>
				</td>
			</tr>
			<tr></tr>
			<tr></tr>
			
			<tr><td><input name="submit" type="submit" class="button2" value="View List"/></td></tr>

		</table>

		</form>
				</fieldset>
      		</div>
			
			<div style="position:absolute; left:360px; top:520px; width: 400px; height: 166px;">
			<fieldset>
      
    <legend><font color="Blue"><strong><font size="4">Your FriendList</font></strong></font></legend>
		
		<%
	int fid=0;
	String relationship=request.getParameter("relationship");
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String status="Confirm";
	String sql="select * from request where id='"+id+"' and relationship='"+relationship+"' and status='"+status+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		
		%>
		
		
		<table align="center" height="185">
			<tr><td height="34"><strong>RelationShip:&nbsp;&nbsp;&nbsp;<%=relationship%></strong></td></tr>
			
				<%while(rs2.next()){
				fid=rs2.getInt("fid");
				
				System.out.println("friend id"+fid);
				Connection con3=null;
				Statement st3=null;
				ResultSet rs3=null;
				String statusb="Allow";
				String setting="public";
				String sql3="select * from reg where id='"+fid+"'";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");	
					con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");;
					st3=con3.createStatement();
					rs3=st3.executeQuery(sql3);
					while(rs3.next()){
					System.out.println("image id"+rs3.getInt("id"));
				%>
				<tr><td height="30">Name:
				<a href="holder2.jsp?id=<%=fid%>"><strong><font color="Navy"><%=rs3.getString("name")%></font></strong></a>
				</td></tr>
				<tr><td>
				<a href="holder2.jsp?id=<%=fid%>"><img src="viewimage.jsp?id=<%=rs3.getInt("id")%>" alt="" width="120" height="99" /></a>
				</td><td>Click the Image To View Their Profile</td></tr>
				<%}
				}
				catch(Exception e3)
					{
						System.out.println(e3);
					}
				}%>
			
		</table>

		<%
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
 
  %>
  </fieldset>
  </div>
		</div><!--end fragment-2-->
			
		</div>

	</div>

	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->


</body>
</html>
