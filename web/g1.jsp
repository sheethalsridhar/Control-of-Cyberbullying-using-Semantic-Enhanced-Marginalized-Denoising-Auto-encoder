<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");     

Statement st = con.createStatement();
Statement st2=con.createStatement();
ResultSet rs=st.executeQuery("select count(*) from reg");
rs.next();
int rc=rs.getInt(1);
System.out.println("=reg==="+rc);
ResultSet rs23=st2.executeQuery("select count(*) from buser");
rs23.next();
int bc=rs23.getInt(1);
System.out.println("=bc==="+bc);
int t1 = 0, t2 = 0, t3 = 0;
    int a = 0, b = 0;
    double per, td;
    double stress, normal;
    t1=rc+bc;
    t2=rc;
    t3=bc;
    per = 100 / t1;
    stress = t2 * per;
                a = (int) Math.round(stress);
                normal = t3 * per;
                b = (int) Math.round(normal);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
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
                                {y: va1, label: "Registerd Users"},
                                {y: va2, label: "Number Of Blocked"},
                            ]
                        }]
                });
                chart.render();
            }
        </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 400px; width: 100%;"></div>
        <script src="graph.js"></script>
    </body>
</html>
