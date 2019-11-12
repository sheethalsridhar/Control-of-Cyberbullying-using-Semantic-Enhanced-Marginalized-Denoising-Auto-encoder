<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" %>
<%@page import="SourceCode.DbConnection" %>
<%
    String name = (String) session.getAttribute("UserName");

//
    String userid = (String) session.getAttribute("UID");
    System.out.println("Print User ID : " + userid);
    Connection con = DbConnection.getConnection();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    double t1 = 0, t2 = 0, t3 = 0;
    int a = 0, b = 0;
    double per;
    double stress, normal;
    try {
//        ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) AS TweetCount FROM tweet WHERE uid ='" + userid + "'");
//        if (rs1.next()) {
//            t1 = rs1.getInt("TweetCount");
        t1=Double.parseDouble(session.getAttribute("t").toString());
            System.out.println("Total count of Tweet : " + t1);
//            ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) AS StressTweet FROM tweet WHERE uid ='" + userid + "' AND stress='Stressd Tweet'");
//            if (rs2.next()) {
//                t2 = rs2.getInt("StressTweet");
            t2=Double.parseDouble(session.getAttribute("stc").toString());
                per = 100 / t1;
//                t3 = t1 - t2;
                t3=Double.parseDouble(session.getAttribute("ntc1").toString());
                System.out.println("total Persentage : " + per);
                stress = per * t2;
                System.out.println("Stress Level Persantage : " + stress);
                a = (int) Math.round(stress);
                normal = per * t3;
                System.out.println("Normal Level Persantage : " + normal);
                b = (int) Math.round(normal);
                System.out.println("Integer A and B : " + a + "\t" + b);
//            }
//        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detecting Stress Based on Social Interactions </title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
        <script>
            window.onload = function() {
                var va1 =<%=a%>;
                var va2 =<%=b%>;
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    title: {
                        text: ""
                    },
                    data: [{
                            type: "pie",
                            startAngle: 240,
                            yValueFormatString: "##0.00\"%\"",
                            indexLabel: "{label} {y}",
                            dataPoints: [
                                {y: va1, label: "Stressed Tweets"},
                                {y: va2, label: "Normal Tweets"},
                            ]
                        }]
                });
                chart.render();
            }
        </script>
        <style>
            .container .box{
                width: 100px;
                float: left; 
                margin: 2px;
                padding: 5px;
                border: 1px solid #ccc;
                text-align: center;
            }

            /*Fade all the DIV when user hovers on any div*/
            .container:hover .box{
                zoom: 1;
                filter: alpha(opacity=45);
                opacity: 0.45;
                -webkit-transition: opacity .5s ease-in-out;
                -moz-transition: opacity .5s ease-in-out;
                -ms-transition: opacity .5s ease-in-out;
                -o-transition: opacity .5s ease-in-out;
                transition: opacity .5s ease-in-out;
            }

            /*Fade out the particular DIV when user hover on that DIV*/
            .container .box:hover{
                box-shadow: 3px 3px 15px #666;
                border-color:#C76C0C;
                background: #C76C0C;
                color: #fff;
                cursor: pointer;

                /*Opacity*/
                zoom: 1;
                filter: alpha(opacity=100);
                opacity: 1;
            }
        </style>
        <style>
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            #aaa:hover
            {
                color: red;
            }
            #bb:hover{
                color: #7ed321;
            }
            #ccc:hover{
                color: #00abf0;
            }

        </style>

        <style>
            .modal1 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .modal-content1 {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }
            .close1 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close1:hover,
            .close1:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            label {
                font-size: 16px;
            }
        </style>
    </head>
    <body class="skin-blue">
        <div class="wrapper">
            <header class="main-header">
                <a href="index2.html" class="logo"><img src="img\icon.png" width="64" height="64"></a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li style="font-size: 26px; font-family: serif ; color: white">Detecting Stress Based on Social Interactions in Social Networks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="img\admin.png" class="user-image" alt="User Image"/>
                                    <span class="hidden-xs">Admin</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="img\admin.png" class="img-circle" alt="User Image" />
                                        <p>
                                            Admin
                                            <small></small>
                                        </p>
                                    </li>

                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="index.jsp" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel" style="width: 400px">
                        <div class="pull-left image">
                            <img src="img\admin.png" class="img-circle"  alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Admin</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <ul class="sidebar-menu">
                        <li class="header" style="color: #fefefe">MAIN NAVIGATION</li>
                        <li class="active treeview">
                            <a href="admin_home.jsp">
                                <span>User Details</span>
                            </a>
                            <a href="user_stress.jsp">
                                <span>User Stress Level</span>
                            </a>
                            <a href="over_stress.jsp">
                                <span>Overall Stress Level</span>
                            </a>
                        </li>
                </section>
            </aside>
            <div class="content-wrapper">
                <!------------------------------------------------------ Content Header (Page header) ------------------------>
                <div style="background-color: #fff">
                    <center>
                        <h1 style="font-family: fantasy">Stress Level of the each User</h1>
                        <br>
                        <img src="view_img1.jsp?id=<%=userid%>" width="200" height="200"><br>

                        <label><%=name%></label><br>
                        <label>Last Tweet State : <font style="color: #00abf0"><%=session.getAttribute("Last_Tweet")%></font></label><br>
                        <label>Overall Tweet State</label>
                        <br><label style="color: #CC0033"><%=a%>%  Stressed Tweet</label>
                        <br><label style="color: #7ed321"><%=b%>%  Normal Tweet's</label>
                    </center>
                </div>
                <div id="chartContainer" style="height: 400px; width: 100%;"></div>
                <script src="graph.js"></script>
            </div>

            <!------------------------------------------------------ Content Header (Page header) ------------------------>
        </div><!-- /.content-wrapper -->

        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0
            </div>
            <strong>Copyright &copy; 2017-2018 <a href="#">Mindsoft</a>.</strong>
        </footer>
    </div>

    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>
    <script src="dist/js/demo.js" type="text/javascript"></script>
</body>
</html>


