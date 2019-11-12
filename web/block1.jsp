<%-- 
    Document   : block
    Created on : Oct 2, 2013, 11:37:44 AM
    Author     : ibn
--%>

<%@page import="data.Spelling"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.Dictionary"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="data.JazzySpellChecker"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      
            String block = request.getParameter("text");

boolean val1=false;
int c=0;

            /*  String   val1 = rs.getString("dise");
             String  t3 = " ";

             if (val1.indexOf(t3) >= 0) {
             }

             */
            //  session.setAttribute("id",block);

            System.out.println("value get is " + block);
            boolean bol = false;
            String getU = session.getAttribute("userid").toString();
            System.out.println("ID " + getU);

//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1", "root", "root");
//            Statement st = con.createStatement();
//            String Q = "select * from admin";// where word= '" + block + "'   ";
//            ResultSet rs = st.executeQuery(Q);
//            while (rs.next()) {
            
             JazzySpellChecker jazzySpellChecker = new JazzySpellChecker();
              String line=" ";
              String mwords[]=block.split(" ");
              StringBuffer sb=new StringBuffer();
              for(int i=0;i<mwords.length;i++)
              {
                  sb.append(new Spelling("D:\\new code\\find1.txt").correct(mwords[i])+" ");
              }
              System.out.println("reconstructed line isss===="+sb.toString()+"\n-------");
              val1=jazzySpellChecker.Checkdetection(sb.toString());
              if(val1)
              {
                  session.setAttribute("stUpdate","block");
                  response.sendRedirect("msg1.jsp?"+block);
                  
              }
              else
              {
                  response.sendRedirect("fornonblock1.jsp?"+block);
              }
              
     
             /* StringTokenizer str1=new StringTokenizer(block," ");
  while(str1.hasMoreTokens())
  {
    String word=str1.nextToken();
   Pattern p = Pattern.compile("[-+^:~@#$%*]");
     Matcher m = p.matcher(word);
    // boolean b = m.matches();
     boolean b = m.find();
     if (b == true)
     {
        System.out.println("wordddd " +word);
  String input=word.replaceAll("[-+.^:~@#$%*]", "");
 System.out.println("entered msggggg isssssssssss"+input);
//                val1=jazzySpellChecker.run(input);
               System.out.println("liiiiiiiii"+input);
                val1 = jazzySpellChecker.getCorrectedLine(input);
                c++;
                break;
              //  val12=jazzySpellChecker.search(word);
//                 session.setAttribute("stUpdate", "block");
//                    response.sendRedirect("msg.jsp?" + block);
//                    break;
                   
  }
  
  else
  {
          
          
               val1=jazzySpellChecker.search(word);
               if(val1)
               {
                   c++;
                   break;
               }
  }
  }
                               
     if(c>0){
                    session.setAttribute("stUpdate", "block");
                    response.sendRedirect("msg.jsp?" + block);
                   
                  
     }
  
            
            else {
                  
                   
                 
                      response.sendRedirect("fornonBlock.jsp?" + block);
                    }
           
                              
                
                 
       

            /*   String Q = "select * from admin where word= '" + block + "'   ";

             ResultSet rs = st.executeQuery(Q);
             if (rs.next()) {
             if ((rs.getString("word").equals(block))) {
             //  response.sendRedirect("status.jsp?msg=Wrong");
             //out.println("Wrong Word..") ;
             response.sendRedirect("msg.jsp?" + block);

             }

             } else {
             response.sendRedirect("fornonBlock.jsp?" + block);
             }

          
             */












            /*    else{
             String name = null;
             //System.out.println("Word OK");
             Connection cons = databaseconnection.databasecon.getconnection();
             Statement sts = cons.createStatement();
             Statement sts1 = cons.createStatement();
             ResultSet rr = sts1.executeQuery("select * from reg where userid = '"+(String)session.getAttribute("userid")+"'");
             if(rr.next()){
             name = rr.getString("fname");
             }
             int ii = sts.executeUpdate("insert into update_ values('"+name+"','"+block+"')");
             if(ii!=0){
                       
             }
             else{
             out.println("Error");
             }
             }
              */
        %>
    </body>
</html>
