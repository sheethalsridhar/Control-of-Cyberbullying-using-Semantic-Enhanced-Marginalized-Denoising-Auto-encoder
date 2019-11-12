<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
    String name = null, userid = null, id = null, pname = null;
    try {

session.setAttribute("stUpdate","unblock");
        Connection con;
        con = databasecon.getconnection();
        Statement st = con.createStatement();

        userid = (String) session.getAttribute("userid");

        String s = "select id,name,userid from reg where userid='" + userid + "'";

        ResultSet rs = st.executeQuery(s);

        if (rs.next()) {
            id = rs.getString(1);
            name = rs.getString(2);

            userid = rs.getString(3);

            session.setAttribute("id11", id);
            session.setAttribute("id", id);

        } else {
            out.print("Please check your login credentials");
        }


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
      <%
  if(request.getParameter("m3")!=null)
     {
      out.println("<script>alert('login is success')</script>");
}
         
        if(request.getParameter("message1")!=null)
            out.println("<script> alert('profile updated success')</script>");
%>


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
                <div><img src="viewimage.jsp?id=<%=id%>" alt="" width="150" height="120" /></div>
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
                            <li><a href="status.jsp"><font color="blue" size="3">Status Update</font></a></li>
                            <li><a href="friends.jsp"><font color="blue" size="3">Find Friends</font></a></li>
                            <li><a href="viewrequest.jsp"><font color="blue" size="3">ViewFriendRequest</font></a></li>
                            <li><a href="owner1.jsp?id=<%=(String) session.getAttribute("id") %>"><font color="blue" size="3">Profile Modify</font></a></li>
                            <li><a href="upload.jsp"><font color="blue" size="3">Share Photo</font></a></li>
                            <li><a href="holder.jsp"><font color="blue" size="3">FriendsList</font></a></li>
                            <li><a href="notify.jsp"><font color="blue" size="3">Notification</font></a></li>
                        </ul>
                    </li>



                </ul>
            </div>


        </div>

        <br><br>

        <div id="content">
            <!--fragment-2-->
            <div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
                <%
                    int fid = 0;
                    String fname = null;
                    Connection con2 = null;
                    Statement st2 = null;
                    ResultSet rs2 = null;
                    String status = "Confirm";
                    String sql = "select distinct fid,fname from request where id='" + id + "' and status='" + status + "'";
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");;
                        st2 = con2.createStatement();
                        rs2 = st2.executeQuery(sql);

                %>

                <div style="position:absolute; left:550px; top:240px;"><font color="Blue" size="5"><font color="red"> 
                    Walls</font></font></div>
                <div style="position:absolute; left:550px; top:325px; width: 358px; height: 166px;">

                    <fieldset>

                        <legend><font color="Blue"><strong><font size="4">Posted Image</font></strong></font></legend>
                        <table align="center" height="174">


                            <%while (rs2.next()) {
                                    fid = rs2.getInt("fid");
                                    fname = rs2.getString("fname");
                                    System.out.println("friend id" + fid);
                                    Connection con3 = null;
                                    Statement st3 = null;
                                    ResultSet rs3 = null;
                                    String statusb = "Allow";
                                    String setting = "public";
                                    String sql3 = "select * from view where (uid='" + fid + "' and statusb='" + statusb + "') or (uid='" + fid + "' and setting='" + setting + "') or (user='" + fname + "' and statusa='" + statusb + "') or (setting='" + setting + "')";
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");
                                        st3 = con3.createStatement();
                                        rs3 = st3.executeQuery(sql3);
                                        while (rs3.next()) {

                                            System.out.println("image id" + rs3.getInt("id"));
                            %>
                            <tr><td>
                                    <img src="view1.jsp?id=<%=rs3.getInt("id")%>" alt="" width="120" height="99" />
                                </td>
                                <td><font color="Blue"><strong>Posted By</strong></font>:&nbsp;&nbsp; 
                                    <%=rs3.getString("name")%>
                                </td>
                                
                        </tr>
                            <%}
                                    } catch (Exception e3) {
                                        System.out.println(e3);
                                        }
                                    }%>

                        </table>
                    </fieldset>
                </div>
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

</body>
</html>
