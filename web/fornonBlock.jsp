<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%String name = null;
System.out.println("resQ"+request.getQueryString());
                     System.out.println("Word OK"+session.getAttribute("ll"));
                     String stUpdate = (String) session.getAttribute("stUpdate");
                     if(stUpdate.equals("block") ){
                       response.sendRedirect("status.jsp?Statid=U cant update status!");  
                     }else{
                     Connection cons = databaseconnection.databasecon.getconnection();
                     Statement sts = cons.createStatement();
                     Statement sts1 = cons.createStatement();
                     ResultSet rr = sts1.executeQuery("select * from reg where userid = '"+(String)session.getAttribute("userid")+"'");
                     if(rr.next()){
                         name = rr.getString("fname");
                     }
                     int ii = sts.executeUpdate("insert into update_ values('"+name+"','"+request.getQueryString().trim()+"','"+"public"+"',now())");
                    if(ii!=0){
                       response.sendRedirect("status.jsp?Statid=status updated..!");
                     }
                     else{
                         out.println("Error");
                     }}
                     %>