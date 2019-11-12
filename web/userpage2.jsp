<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
    try {

        String fname = null, sname = null, userid = null, id = null;
        Connection con;
        con = databasecon.getconnection();
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
        <script language="JavaScript">
            function validation()

            {
                var a = document.f1.user.value;
                var a1 = document.f1.statusa.value;
                var b = document.f1.relationship.value;
                var b1 = document.f1.statusb.value;
                var c = document.f1.fgroup.value;
                var c1 = document.f1.statusc.value;
                if(document.f1.user.selectedIndex==0)
                {
                    alert("Please select The Username");
                    document.f1.user.focus();
                    return false;
                }
                if ( ( f1.statusa[0].checked == false )&&(f1.statusa[1].checked == false))
                {
                    alert ( "Please click anyone " );
                    return false;
                }
                if(document.f1.relationship.selectedIndex==0)
                {
                    alert("Please select The relationship");
                    document.f1.relationship.focus();
                    return false;
                }
                if ( ( f1.statusb[0].checked == false )&&( f1.statusb[1].checked == false ))
                {
                    alert ( "Please click anyone " );
                    return false;
                }
                if(document.f1.fgroup.selectedIndex==0)
                {
                    alert("Please select The Group");
                    document.f1.fgroup.focus();
                    return false;
                }
                if ( ( f1.statusc[0].checked == false )&&( f1.statusc[1].checked == false ))
                {
                    alert ( "Please click anyone " );
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
                <font color="Navy"><font size="5"> <%=fname%></font></font>

                <font color="Navy"><font size="5"><%=sname%></font></font></h2>
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
            <div style="position:absolute; left:400px; top:240px;"><font color="Blue" size="5"><font color="red"> 
                Privacy Settings</font></font></div>
            <div id="fragment-2" class="ui-tabs-panel ui-tabs-hide">
                <div style="position:absolute; left:400px; top:341px; width: 398px; height: 140px;">
                    <form name="f1" ENCTYPE="multipart/form-data" action="uploadpage2.jsp" method="post" onsubmit="return validation();">
                        <fieldset>

                            <legend><font color="Blue"><strong><font size="4">Select Settings</font></strong></font></legend>
                            <table align="center" height="150">
                                <%
                                    int pid = 0, s = 0;
                                    Connection con2 = null;
                                    Statement st2 = null;
                                    ResultSet rs2 = null;
                                    String sql = "select * from reg ";
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");;
                                        st2 = con2.createStatement();
                                        rs2 = st2.executeQuery(sql);


                                %>
                                <tr><td><select name="user">
                                            <option value="select">------Select User------</option>
                                            <%while (rs2.next()) {%>
                                            <option value="<%=rs2.getString("name")%>"><%=rs2.getString("name")%></option>
                                            <%}%>

                                        </select></td>
                                </tr>
                                <tr></tr>
                                <tr></tr>
                                <tr><td><input type="radio" name="statusa" value="Allow">Allow<input type="radio" name="statusa" value="Deny">Deny</td></tr>
                                <tr></tr>
                                <tr></tr>
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
                                <tr><td><input type="radio" name="statusb" value="Allow">Allow<input type="radio" name="statusb" value="Deny">Deny</td></tr>
                                <tr></tr>
                                <tr></tr>
                                <tr><td>
                                        <select name="fgroup">
                                            <option value="select">-----------Group----------</option>
                                            <option value="Friends">Friends</option>
                                            <option value="Family">Family</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr></tr>
                                <tr><td><input type="radio" name="statusc" value="Allow">Allow<input type="radio" name="statusc" value="Deny">Deny</td></tr>
                                <tr></tr>
                                <tr></tr>
                                <tr><td><input name="submit" type="submit" class="button2" value="Save privacy settings"/>&nbsp;&nbsp;<input name="submit" type="submit" class="button2" value="Clear"/></td></tr>
                                        <%
                                            } catch (Exception ex) {
                                                System.out.println(ex);
                                            } finally {
                                                con2.close();
                                                st2.close();
                                            }

                                        %>
                            </table>
                        </fieldset>
                    </form>
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
