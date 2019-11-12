<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
    String name = null, userid = null, id = null;
    try {


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

            session.setAttribute("id", id);
            session.setAttribute("name", name);
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
        <!-- start header -->
        <div id="header">
            <div id="logo">

                <h1 align="center"><font size="+3">Cyberbulling
                    </font></h1>

            </div>

        </div>

        <div style="position:absolute; left:730px; top:370px"><img src="images/diss.JPG" width="380"></div>


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

                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            <div id="leftbar" class="sidebar">
                <ul>
                    <li>

                        <ul>
                            <br><br>
                            <li><a href="status.jsp"><font color="Blue" size="3">Status Update</font></a></li>
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
            <!--fragment-2-->
            <div style="position:absolute; left:400px; top:240px;"><font color="Blue" size="5"><font color="red"> 
                View FriendProfile</font></font></div>
            <div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
                <div style="position:absolute; left:400px; top:325px; width: 358px; height: 166px;">

                    <fieldset>

                        <legend><font color="Blue"><strong><font size="4">View</font></strong></font></legend>

                        <form name="f1" action="holder1.jsp" method="post">

                            <table align="center" height="102">


                                <tr><td>
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

                <div style="position:absolute; left:360px; top:520px; width: 360px; height: 166px;">
                    <fieldset>

                        <legend><font color="Blue"><strong><font size="4">Image</font></strong></font></legend>
                        <table align="center" height="150">
                            <tr><td>ImageOf <%=session.getAttribute("name1")%></td>

                            </tr>

                            <%
                                Connection con3 = null;
                                Statement st3 = null;
                                ResultSet rs3 = null;
                                String uid = request.getParameter("id");
                                String statusb = "Allow";
                                String setting = "public";
                                String sql3 = "select * from view where (uid='" + uid + "' and statusb='" + statusb + "') or (uid='" + uid + "' and setting='" + setting + "')";
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");;
                                    st3 = con3.createStatement();
                                    rs3 = st3.executeQuery(sql3);
                                    while (rs3.next()) {
                                        System.out.println("image id" + rs3.getInt("id"));
                            %>
                            <tr><td>
                                    <a href="holder4.jsp?id1=<%=rs3.getInt("id")%>"><img src="view1.jsp?id=<%=rs3.getInt("id")%>" alt="" width="120" height="99" /></a>
                                </td>
                                <td>Click this Image To Share</td>
                            </tr>
                            <%}
                                } catch (Exception e3) {
                                    System.out.println(e3);
                                }
                            %>


                            <tr><td><input name="submit" type="submit" class="button2" value="Share"/></td></tr>
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
