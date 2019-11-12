<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Learn to Personalized Image Search from the Photo Sharing Websites</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <!--[if IE 7]>
                <link rel="stylesheet" href="css/ie7.css" type="text/css" />
        <![endif]-->
    </head>
    <body>
        <div class="page">
            <div class="header">
               <h2>Learn to Personalized Image Search from the
                    Photo Sharing Websites</h2> <ul>
                     <li class="selected"><a href="userpage.jsp">Home</a></li>
                    
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
            <div class="body">
                <div id="featured">
                    <%if (request.getParameter("msg") != null) {
                                                 out.println(request.getParameter("msg"));
                                             }%>
                    <h2>New User</h2>
                    <form name="" action="ProfileImage" method="post" enctype="multipart/form-data">
                        <table>
                            <tr><td>Choose File</td><td><input type="file" size="30"  id="file" name="file"/></td></tr>
                            <tr>
                                <td></td><td><input type="submit" value="Update" /></td></tr>

                        </table>
                    </form>
                </div>
                    <div id="rightA">                                                
                    </div>
            </div>
        </div>
    </body>
</html>  