<%
    try {

        String fname = null, sname = null, userid = null, id = null;
        Connection con;
        con = databaseconnection.databasecon.getconnection();
        Statement st = con.createStatement();
        int pid = (Integer) (session.getAttribute("pid"));
        //fname=(String)session.getAttribute("fname");
        //sname=(String)session.getAttribute("sname");
        userid = (String) session.getAttribute("userid");

        String s = "select id,fname,sname,userid from reg where userid='" + userid + "'";

        ResultSet rs = st.executeQuery(s);

        if (rs.next()) {
            id = rs.getString(1);
            fname = rs.getString(2);
            sname = rs.getString(3);
            userid = rs.getString(4);
            System.out.println(fname);
            System.out.println(sname);
            session.setAttribute("fname1", fname);
            session.setAttribute("sname1", sname);
           //
            session.setAttribute("id", id);

        } else {
            out.print("Please check your login credentials");
        }


%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    // String name = null;
    Connection conm = databaseconnection.databasecon.getconnection();
    Statement stss = conm.createStatement();
    ResultSet res = stss.executeQuery("select * from reg where userid = '" + (String) session.getAttribute("userid") + "' ");
    if (res.next()) {
        //  name = res.getString("fname");
    }
%>



<html>
    <head>
        <SCRIPT>
            function chek(){
  
            }
        </SCRIPT>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Cyberbulling</title>

        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="styles.css" rel="stylesheet" type="text/css" media="screen" />
        <script language="JavaScript">
            function validation()
            {
                var a = document.f1.text.value;

                if(a=="")
                {
                    alert("Enter your status..!");
                    document.f1.image.focus();
                    return false;
                }
                /*else{
                    var msg = "Bad Words Filtering ?? ";

                   // if (confirm(msg)) 
                        location.replace("status.jsp");

                    else
                        location.replace("block.jsp?text"+a);
                }*/
                           

            }
        </script>
        

    </head>
    <%

        // if (request.getParameter("msg") != null) {

        //     out.println("<script>alert('Blocked..!')</script>");
        //}
%>
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
                <font color="navy"><font size="5"> <%=fname%></font></font>

                <font color="navy"><font size="5"><%=sname%></font></font></h2>
            <div><img src="viewimage.jsp?id=<%=id%>" alt="" width="120" height="99" /></div>
                <%

                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>


            <div id="leftbar" class="sidebar">
                <ul>
                    <li>

                        <ul>
                            <br><br>
                            <li><a href="friends.jsp"><font color="blue" size="3">Find Friends</font></a></li>
                            <li><a href="viewrequest.jsp"><font color="blue" size="3">ViewFriendRequest</font></a></li>

                            <li><a href="upload.jsp"><font color="blue" size="3">Share Photo</font></a></li>
                            <li><a href="holder.jsp"><font color="blue" size="3">FriendsList</font></a></li>
                            <li><a href="owner1.jsp?id=<%=(String) session.getAttribute("id") %>"><font color="blue" size="3">Profile Modify</font></a></li>
                        </ul>
                    </li>



                </ul>
            </div>


        </div>

        <br><br>

        <div id="content"> <div id="content">
          

            <div style="position:absolute; left:600px; top:255px;"><font color="Blue" size="5"><font color="red"> 
                &nbsp;&nbsp;&nbsp;Posts</font></font>
                
                <% String stat = request.getParameter("Statid");
                
                if(stat!=null){
                %>
                <% out.println(stat); %>
                <%
                }

%>
            
                
            </div>

            <div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
                <%
                    int pid = 0, s = 0;
                    Connection con2 = null, ccc = null;
                    Statement st2 = null;
                    ResultSet rs2 = null;
                    String sql = "select max(id) from  view";
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");;
                        st2 = con2.createStatement();
                        rs2 = st2.executeQuery(sql);
                        if (rs2.next()) {
                            if (rs2.getInt(1) == 0) {
                                pid = 1;
                            } else {
                                pid = rs2.getInt(1) + 1;
                            }
                            session.setAttribute("pid", pid);
                            System.out.println(pid);
                        }
                %>
                <div style="position: absolute;left: 500px; top: 325px;">
               
<%
           String g = null, names = null;
                    ccc = databaseconnection.databasecon.getconnection();
                    Statement sss = ccc.createStatement();
                    ResultSet rss = sss.executeQuery("select * from update_ where permission='"+(String)session.getAttribute("fname1")+"' or permission='public' order by dat_ DESC");
                    while (rss.next()) {
                        if(rss.getString("permission").equals("public"))
                                                       {
                        g = rss.getString("statusa").replaceAll("%20", " ");
                     //String  str = str stringByReplacingOccurrencesOfString:@" " withString:@"%20";
                        names = rss.getString("user");

                %>

                <div style="margin-top:90px; margin-bottom: -65px; ">
                    <p><font color="blue">Posted By</font> &nbsp;<%=names%></p>
                    <input style="width: 300px; height: 30px;"value="<%=g%>"></input>
                </div>
                <%
                               }
                        else
                         {
                             names = rss.getString("user");
                             g = rss.getString("statusa").replaceAll("%20", " ");
            %>
                        
            <div style="margin-top:90px; margin-bottom: -65px; ">
                    <p><font color="blue">Directly Posted on your Wall By</font> &nbsp;<%=names%></p>
                    <input style="width: 300px; height: 30px;"value="<%=g%>"></input>
                </div>
                         
                         
                         <%
                            
                        }
                    }
                %>
                </div>
                </div><br><BR>
                <%
                    } catch (Exception ex) {
                        System.out.println(ex);
                    } finally {
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
<!--<div id="footer">


   <p align="right"><font color="#FFFFFF" size="2"><strong>Online Social Network</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon3.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon1.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon4.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon5.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Icon7.png" width="30" height="30"></p>
</div>-->

</body>
</html>
