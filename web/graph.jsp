<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" %>
<%@page import="SourceCode.DbConnection" %>
<%
    String userid = (String) session.getAttribute("UID");
    System.out.println("Print User ID : " + userid);
    Connection con = DbConnection.getConnection();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    DecimalFormat df = new DecimalFormat("0.00");
    int t1 = 0, t2 = 0, t3 = 0;
    int a = 0, b = 0;
    double per, td;
    double stress, normal;
    try {
        ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) AS TweetCount FROM tweet WHERE uid ='" + userid + "'");
        if (rs1.next()) {
            t1 = rs1.getInt("TweetCount");
            System.out.println("Total count of Tweet : " + t1);
            ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) AS StressTweet FROM tweet WHERE uid ='" + userid + "' AND stress='Stressd Tweet'");
            if (rs2.next()) {
                t2 = rs2.getInt("StressTweet");
                per = 100 / t1;
                t3 = t1 - t2;
                System.out.println("total Persentage : " + per);
                stress = t2 * per;
                a = (int) Math.round(stress);
                normal = t3 * per;
                b = (int) Math.round(normal);
                System.out.println("Integer a and B : " + a + "\t" + b);
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
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
                                {y: va1, label: "Stressd Tweets"},
                                {y: va2, label: "Normal Tweets"},
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
