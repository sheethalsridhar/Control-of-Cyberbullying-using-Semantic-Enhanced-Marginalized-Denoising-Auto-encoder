<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Cyberbulling</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="tabs.css" type="text/css" media="screen, projection"/>

	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.7.custom.min.js"></script>
    <script type="text/javascript">
		$(function() {

			var $tabs = $('#tabs').tabs();
	
			$(".ui-tabs-panel").each(function(i){
	
			  var totalSize = $(".ui-tabs-panel").size() - 1;
	
			  if (i != totalSize) {
			      next = i + 2;
		   		//  $(this).append("<a href='#' class='next-tab mover' rel='" + next + "'>Next Page &#187;</a>");
			  }
	  
			  if (i != 0) {
			      prev = i;
		   		//  $(this).append("<a href='#' class='prev-tab mover' rel='" + prev + "'>&#171; Prev Page</a>");
			  }
   		
			});
	
			$('.next-tab, .prev-tab').click(function() { 
		           $tabs.tabs('select', $(this).attr("rel"));
		           return false;
		       });
       

		});
    </script>
<script language="JavaScript">
function validation()
{
var a = document.form.secondary.value;
var b = document.form.university.value;
var c = document.form.employee.value;
var d = document.form.image.value;
if(a=="")
{
alert("Enter your secondary school");
document.form.secondary.focus();
return false;
}
if(b=="")
{
alert("Enter your university");
document.form.university.focus();
return false;
}
if(c=="")
{
alert("Enter your employee");
document.form.employee.focus();
return false;
}
if(d=="")
{
alert("Enter your photo");
document.form.image.focus();
return false;
}
}
</script>
<body>

<form name="form" ENCTYPE="multipart/form-data" action="profileinsert1.jsp" method="post" onSubmit="return validation();">
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
<div id="content">
      <p><font size="5"><strong>Welcome!</strong></font>
	  &nbsp; 
       <font color="#FF0000"><font size="5"></font></font>
        &nbsp; 
        <font color="#FF0000"><font size="5"></font></font>
		
      </p>
		<div id="page-wrap">
		
		<div id="tabs">
		
    		<ul>
        		
          
        		
          <li><a href="#fragment-2"><font color="#CC0000">Step2:</font>Profile Information</a></li>
        		
          <li><a href="#fragment-3"><font color="#CC0000">Step3:</font>Profile Picture</a></li>
        		
    	   </ul>
	
        	
        	
        	<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
            
          <p><font color="#000000"><strong><font size="3">&nbsp;&nbsp;&nbsp;Fill In Your Profile 
            Information</font></strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <font color="#FF0000">(This Information will help you find your friends)</font></p>
			


			<table width="440" height="125">

	<tr>
	            <td width="224" height="38" >&nbsp;&nbsp;&nbsp;<font color="#000000">Secondary 
                  School</font></td>
	<td width="204"><input type="text" name="secondary" id="s" size="25" value="" /></td>
	</tr>
	<tr>
	<tr>
	            <td width="224" height="39" >&nbsp;&nbsp;&nbsp;<font color="#000000">College 
                  University</font></td>
	<td width="204"><input type="text" name="university" id="s" size="25" value="" /></td>
	</tr>
	<tr>
	<tr>
    <td width="224" height="34">&nbsp;&nbsp;&nbsp;<font color="#000000">Employee</font></td>
	<td width="204"><input type="text" name="employee" id="s" size="25" value="" /></td>
	</tr>
	
	
	
	</table>
      
	        </div>
            
			
			
			
			
			
			
			
			
			
        	<div id="fragment-3" class="ui-tabs-panel ui-tabs-hide">
			<br><br>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/qqqq.png" width="170" height="160"></p>
            <div style="position:absolute; right:90px; top:80px; width: 346px; height: 82px;"> 
              <table>
            <tr> 
                <td width="120" height="35"><font color="#000000">Upload photo</font></td>
              <td width="204"><input type="file" name="image"></td>
            </tr>
			 <tr>
<td height="52"></td>
     <td><input name="submit" type="submit" class="button2" value="Save And Continue"/></td>          
</tr>
          </table>
		      
            </div>
        </div>
        
        	
        	
        	
        	</div>

        </div>
		
	</div>

	</div>
	
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->
<br><br><br><br><br><br>
<div id="footer">
	

  <p align="right"><font color="#FFFFFF" size="2"><strong>Online Social Network</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon3.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon1.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon4.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon5.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Icon7.png" width="30" height="30"></p>
</div>
 </form>

</body>
</html>
