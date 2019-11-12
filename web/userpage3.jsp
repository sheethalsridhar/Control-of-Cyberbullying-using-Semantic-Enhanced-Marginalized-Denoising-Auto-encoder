<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
int countfds=0,countfly=0;
int cf=0,cf1=0;
String fname = null,sname=null,userid=null,id=null;
try{

   
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 	int pid=(Integer)(session.getAttribute("pid"));
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
<div style="position:absolute; left:550px; top:240px;"><font color="Blue" size="5"><font color="red"> 
    ImageView</font></font></div>
		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">

		<div style="position:absolute; left:450px; top:331px; width: 358px; height: 140px;">
		<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">

		
		<fieldset>
      
    <legend><font color="Blue"><strong><font size="4">Image</font></strong></font></legend>

		
		<table align="center" height="150">
			
			
			<tr>
			<tr><td><img src="view.jsp?id=<%=(Integer)(session.getAttribute("pid"))%>" alt="" width="250" height="250" /></td></tr>
			</tr>
			<tr></tr>
			<tr><td><font color="Blue" size="+1"><strong><%=session.getAttribute("user")%> Can view this photo</strong></font></td></tr>
			<tr></tr>
			<tr></tr>
		

		<%
		//no of friends canview
	int fid=0;
	
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
        int pid=(Integer)(session.getAttribute("pid"));
	String status="Confirm";
        String statuses="Allow";
        String funame=null;
        String sqles="select * from view where id="+pid+" and statusa='"+statuses+"'";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");	
            Connection cones=DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");
            Statement stes=cones.createStatement();
            ResultSet rses=stes.executeQuery(sqles);
            while(rses.next())
            {
                  funame=rses.getString("user");
                String sql="select * from request where name='"+funame+"' and status='"+status+"'";
                con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
                while(rs2.next()){
				if(rs2.getString("relationship").equals("Friends")){
					countfds=countfds+1;
				}
				if(rs2.getString("relationship").equals("Family")){
					countfly=countfly+1;
				}
				
			
			}
            }
        }catch(Exception es)
        {
            es.printStackTrace();
        }
        
	
        
	
 //end friends view
  %>
			<tr><td><font color="Blue" size="+1"><strong><%=countfds%> Friends can view this photo</strong></font></td></tr>
			<tr></tr>
			<tr></tr>
			<tr><td><font color="Blue" size="+1"><strong><%=countfly%> Family can view this photo</strong></font></td></tr>
  		</table>
				</fieldset>
</div>
		
		</div><!--end fragment-2-->
			
		</div>

	</div>
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->

</body>
</html>
