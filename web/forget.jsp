
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
var a = document.form.userid.value;
var b = document.form.pass.value;
if(a=="")
{
alert("Enter your UserId");
document.form.userid.focus();
return false;
}
if(b=="")
{
alert("Enter your Password");
document.form.pass.focus();
return false;
}

}
</script>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		
    <h1 align="center"><font size="+3">Cyberbulling</font></h1>
		
	</div>
	
</div>
<!-- end header -->
<!-- start page -->
<div id="page">
	
</div>
<br><br>
	<div id="content" align="center">
		<div class="post">
			<div>
	

				
					<div>
						
        
      
        
      </div>
				
			
	
	</div>
<div>
<fieldset>
      
    <legend><font color="red"><strong><font size="4">Login</font></strong></font></legend>
	  <table height="160">
	<form action="forget1.jsp" method="post" name="form" onsubmit="return validation();">
          
	<tr>
            <td height="37"><font size="4" color="navy">UserId</font></td>
            <td><input type="text" name="userid" id="s" size="15" value="" placeholder="userid" /></td>
	</tr>
	
	

  
  <tr>
<td height="39"></td>
<td><input type="submit" name="submit" class="button2" value="submit">
<input type="reset" name="reset" class="button2" value="Clear">
</td>
</tr>
        </form>
 
	</table>
	  </fieldset>
	<br><br><br>
      
	<p><img src="images/newUser.png"><font color="navy" size="3"><a href="newuser.jsp">New User Signup Here?</a></font></p>
      <p><img src="images/ad.gif"><font color="navy" size="3"><a href="adminLogin.html">For Admin Signin Here</a></font></p></div>
		</div>

	</div>
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->
<br><br><br><br><br><br><br>
<div id="footer">
	

  <p align="right"><font color="#FFFFFF" size="2"><strong>Online Social Network</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon3.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon1.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon4.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon5.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Icon7.png" width="30" height="30"></p>
</div>
</body>
</html>
