<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Cyberbulling</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<script language="JavaScript">
function validation()
{
var a = document.form.fname.value;
var b = document.form.sname.value;
var c = document.form.userid.value;
var d = document.form.remail.value;
var e = document.form.pass.value;
var f = document.form.gender.value;
var g = document.form.date.value;
var h = document.form.month.value;
var i = document.form.year.value;
//var j = document.form.type.value;


if(a=="")
{
alert("Enter your  FirstName");
document.form.fname.focus();
return false;
}
if(b=="")
{
alert("Enter your  SurName");
document.form.sname.focus();
return false;
}
if(c=="")
{
alert("Enter Your valid emailId");
document.form.userid.focus();
return false;
 }
	if (c.indexOf("@", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.form.userid.focus();
return false;
}
if (c.indexOf(".", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.form.userid.focus();
return false;
}	

if(d=="")
{
alert("ReEnter Your valid emailId");
document.form.remail.focus();
return false;
 }
	if (d.indexOf("@", 0) < 0)
{
alert("Please Reenter a valid e-mail address.");
document.form.remail.focus();
return false;
}

if (d.indexOf(".", 0) < 0)
{
alert("Please Reenter a valid e-mail address.");
document.form.remail.focus();
return false;
}
if(c!=d)
    {
        alert("e-mail address Not Matched");
document.form.remail.focus();
return false;
    }
if(e=="")
{
alert("Enter your password");
document.form.pass.focus();
return false;
}
if(document.form.gender.selectedIndex==0)
{ 
alert("Please select Gender");
document.form.gender.focus();
return false;
}
if(document.form.date.selectedIndex==0)
{ 
alert("Please select date ");
document.form.date.focus();
return false;
}
if(document.form.month.selectedIndex==0)
{ 
alert("Please select month ");
document.form.month.focus();
return false;
}
if(document.form.year.selectedIndex==0)
{
 alert("Please select year ");
document.form.year.focus();
return false;
}
/*if(document.form.type.selectedIndex==0)
{ 
alert("Please select UserType");
document.form.type.focus();
return false;
}*/



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
<!-- end header -->
<!-- start page -->
<div id="page">

	<div style="position:absolute; right:40px; top:145px; left: 900px; width: 420px; height: 421px;">
	<p><font color="blue" size="5"><strong>SignUp:</strong></font></p>
	<img src="images/nnn.jpg" width="350" height="5">
<table bgcolor="#ffffff" width="326" height="364">
<form name="form" action="newuserinsert.jsp" method="post" onSubmit="return validation();">
<%
 int n=0,s=0;
 Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select max(id) from reg ";
	try
	{
		con=databasecon.getconnection();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		if(rs.next())
		{
		if(rs.getInt(1)==0)
		n=1;
		else
		n=rs.getInt(1)+1;
		session.setAttribute( "id", n );
		
		}
                
	//out.print(n);
	
	%>

	<tr  >
            <td width="122" height="37"><font color="Blue">FirstName</font></td>
	<td width="100"><input type="text" name="fname" id="s" size="25" value="" /></td>
	</tr>
	<tr  >
	    <td height="36"><font color="Blue">SurName</td>
	<td><input type="text" name="sname" id="s" size="25" value="" /></td>
	</tr>
	<tr  >
	    <td height="37"><font color="Blue">Your Email</td>
	<td><input type="text" name="userid" id="s" size="25" value=""  oncopy="return false"/></td>
	</tr>
	<tr  >
	    <td height="38"><font color="Blue">Re-enter Email</td>
	<td><input type="text" name="remail" id="s" size="25" value="" onpaste="return false" /></td>
	</tr>
	<tr  >
	    <td height="37"><font color="Blue">New Password</td>
	<td><input type="password" name="pass" size="25" value="" /></td>
	</tr>
	<tr  >
	    <td height="38"><font color="Blue">Gender</td>
	<td><select name="gender"  style="background-color:#A4E4F5;">
            <option>----------SelectGender--------</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
			 </select></td>

	</tr>
	<tr>
	<td height="39" class="paragraping1"><font color="Blue">Date Of Birth:</td>
       
<td class="fielditem">
<input id="date" type="date" name="date">
    

						</td>
</tr>
	<!--<tr> 

        <td height="38">UserType</td>
<td><select name="type"  style="background-color:#A4E4F5;">
            <option>-------SelectUserType-------</option>
            <option value="Owner">Owner</option>
            <option value="Contributor">Contributor</option>
			     <option value="Stakeholder">Stakeholder</option>
				 <option value="Disseminator">Disseminator</option>
          </select></td>
  </tr>

  <tr>-->
<td height="42"></td>
<td><input name="submit" type="submit" class="button2" value="SignUp"/>
    <form action="profileinsert.jsp" method="post" name="form" onsubmit="return validation();">
        &nbsp;&nbsp;&nbsp;&nbsp;<input name="reset" type="reset" class="button2" value="Clear"/>
</td>
</tr>
<%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con.close();
		st.close();
	}
 
  %>

</form>
	</table>
				
			
	
	</div>

<br><br>
	<div id="content1" align="left">
		<div class="post">
		
      <p align="left"><strong><font color="#000000">OSN Network</font></strong></p>
	  
			<img src="images/dd.jpg" width="530">
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
