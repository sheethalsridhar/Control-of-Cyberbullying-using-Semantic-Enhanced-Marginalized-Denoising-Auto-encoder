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
var a = document.form.word.value;
if(a == "")
{
alert("Word not entered!! Enter the word.");
document.form.word.focus();
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
<form name="form" action="newwordinsert.jsp" method="post" onSubmit="return validation();">
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
        <p><font size="3"><font color="Blue">Enter The Word
            <input type="text"<input type="text" name="word" id="w" value=""/></p>
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