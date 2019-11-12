<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%String name = null;
System.out.println("resQ"+request.getQueryString());
                     System.out.println("Word OK"+session.getAttribute("ll"));
                     Connection cons = databaseconnection.databasecon.getconnection();
                     Statement sts = cons.createStatement();
                     Statement sts1 = cons.createStatement();
                     String ddname = (String)session.getAttribute("name1");
                     ResultSet rr = sts1.executeQuery("select * from reg where userid = '"+(String)session.getAttribute("userid")+"'");
                     if(rr.next())
                     name = rr.getString("fname");
                     int ii = sts.executeUpdate("insert into notific(buser,cuser,wor) values('"+name+"','"+ddname+"','"+session.getAttribute("ll").toString()+"')");
                    String stUpdate = (String) session.getAttribute("stUpdate");
                     if(stUpdate.equals("block") ){
                       response.sendRedirect("status.jsp?Statid=U cant update status!");  
                     }else{
                     if(rr.next()){
                         name = rr.getString("fname");
                         response.sendRedirect("status.jsp");  
                     }
                     
                                         }
                     %>