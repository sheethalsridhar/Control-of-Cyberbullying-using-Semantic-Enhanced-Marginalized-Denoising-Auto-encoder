<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
try{

   String fname = null,sname=null,userid=null,id=null;
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 
   //fname=(String)session.getAttribute("fname");
   //sname=(String)session.getAttribute("sname");
   userid=(String)session.getAttribute("userid");
  
   String s = "select id,fname,sname,userid from reg where userid='"+userid+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   fname=rs.getString(2);
   sname=rs.getString(3);
   userid=rs.getString(4);
   System.out.println(fname);
   System.out.println(sname);
  session.setAttribute("fname1",fname);
  session.setAttribute("sname1",sname);
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
var a = document.f1.image.value;

if(a=="")
{
alert("Upload The Image");
document.f1.image.focus();
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
 
   <li><a href='#'><span>Tagged</span></a></li>
   
   <li><a href="index.html"><span>Logout</span></a></li>
  <li><a href=""><span>Share</span></a></li>
</ul>
</div>
<div id="page">
<h2>Welcome!&nbsp; 
       <font color="Navy"><font size="5"> <%=fname%></font></font>
        
        <font color="Navy"><font size="5"><%=sname%></font></font></h2>
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
          <li><a href="userpage.jsp"><font color="Blue" size="3">Upload Photo</font></a></li>
					
          <li><a href="friends.jsp"><font color="Blue" size="3">Find Friends</font></a></li>
					
          <li><a href="share.jsp"><font color="Blue" size="3">Share Photo</font></a></li>
					
          <li><a href="holder.jsp"><font color="Blue" size="3">FriendsList</font></a></li>
					
				</ul>
			</li>
			
			
			
		</ul>
	</div>
			
	
	</div>

<br><br>

	<div id="content">
	<div style="position:absolute; left:400px; top:240px;"><font color="Blue" size="5"><font color="red"> 
      Share Image</font></font></div>
		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
		<%
 int n=0,s=0;
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
		n=1;
		else
		n=rs2.getInt(1)+1;
		session.setAttribute( "n", n );
		
		}
		%>
		<form name="f1" ENCTYPE="multipart/form-data" action="uploadimage.jsp" method="post" onsubmit="return validation();">
		<div style="position:absolute; left:360px; top:341px; width: 358px; height: 140px;">
		<fieldset>
      
    <legend><font color="Blue"><strong><font size="4">Upload Image Here</font></strong></font></legend>

		<table align="center" height="150">
			
			<tr>
	    <td width="73"><strong>Image</strong></td>
      <td width="232" height="69"><input type="file" name="image" id="image" size="25" value="" /></td>
    </tr>
    <tr>
	<td></td>
      <td height="44"><input name="submit" type="submit" class="button2" value="Upload"/>&nbsp;&nbsp;&nbsp;
	  <input name="clear" type="reset" class="button2" value="Clear"/>
	  </td>
    </tr>
		</table>
</fieldset>
</div>
		</form>
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
		</div><!--end fragment-2-->
			
		</div>

	</div>
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="footer">
	

  <p align="right"><font color="#FFFFFF" size="2"><strong>Online Social Network</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon3.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon1.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon4.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon5.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Icon7.png" width="30" height="30"></p>
</div>

</body>
</html>
