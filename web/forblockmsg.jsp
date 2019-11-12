<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%String name =session.getAttribute("userid").toString() ;
String word=session.getAttribute("ll").toString();
String word1=word.replaceAll("%20", " ");
String msg="blocked user name :\t"+name+"\t bullying msg:\t"+word1+"\n\r\r";
                 //    System.out.println("Word OK"+session.getAttribute(""));
                     Connection cons = databaseconnection.databasecon.getconnection();
                     Statement sts = cons.createStatement();
                     Statement sts1 = cons.createStatement();
                     File fes=new File("D:/userwords.text");
                     File fes1=new File("D:/"+name+".text");
                     boolean append=true;
                     BufferedOutputStream w=new BufferedOutputStream(new FileOutputStream(fes,append));
                     BufferedOutputStream w1=new BufferedOutputStream(new FileOutputStream("D:/"+name+".text",append));
                     ResultSet rr = sts1.executeQuery("select * from reg where userid = '"+(String)session.getAttribute("userid")+"'");
                     if(rr.next()){
                         name = rr.getString("fname");
                     }
                     int c=sts.executeUpdate("insert into buser values('"+name+"','"+(String)session.getAttribute("ll").toString()+"')");
                     
                     int ii = sts.executeUpdate("insert into new_m values('"+name+"','"+(String)session.getAttribute("ll").toString()+"')");
                    if(ii!=0){
                        w.write(msg.getBytes());
                        w1.write(msg.getBytes());
                        w.close();
                        w1.close();
                       response.sendRedirect("status.jsp?status updated..!");
                     }
                     else{
                         out.println("Error");
                     }
                     %>