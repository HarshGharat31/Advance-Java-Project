<%-- 
    Document   : Art_dashboard
    Created on : 22-Feb-2024, 1:41:15 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>

    <head>
        <title>Home</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .navbar-brand{
                /*color: white;*/
                font-weight: bolder;
            }
            .navbar-brand:hover{
                color: white;
                text-decoration: underline rgb(255, 215, 0);


            }

            .navbar {

                /*backdrop-filter:blur(5px);*/
                /*background-image:  url("img/bg-8 en.png");*/


            }
            .nav-item>a{
                /*color: white;*/
                font-weight: bold;

            }
            .nav-item>a:hover{
                color: white;
                text-decoration: underline white;

            }

            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }
            .backpanel {
                height:100vh;
                width: 100%;
                background-size: cover;
                background-position: center;
                background-image: repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(22.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(157.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),linear-gradient(90deg, rgb(13, 8, 66),rgb(230, 168, 209));

              
            }
            .backpanel>h1{
                color: black;
                font-weight: bolder;
            }
            .container{
                height: 500px;
                width:100%;
                border: 2px black;
            }
            .userprofile{
                display: flex;
            }
            .userprofile p{
                justify-self: center;
            }
            .paint{
                text-decoration: none;
                color: black;
            }
            .cat{
                text-decoration: none;
                color: black;
            }
            .fa-solid{
                margin-top:18px;
            }
            .container{
                backdrop-filter:blur(10px);
                background: transparent;
                border-color: transparent;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <%@include file="Artistnav.jsp" %>
        <div class="backpanel ">

            <h1 class="text-center " style="color: white;">Welcome, <%= session.getAttribute("username") %> </h1><hr>
            <div class="container overflow-hidden   p-4 shadow p-3 mb-5 rounded">





                <div class="row gx-5 "style="margin-top: 150px" >
                    <%
                        int catcount=0;
                   try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                    String sql = "SELECT COUNT(Category) AS cat_count FROM category";
                    PreparedStatement pst = con.prepareStatement(sql);
                     
 
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                   catcount = rs.getInt("cat_count");

                    %>
                    <div class="col ">
                        <div class="p-4 border bg-warning text-center fw-bold" style="font-size: xx-large"><a class="cat" href="Add_new_Cat.jsp">Category</a></div>
                        <div class="p-3 border bg-light text-center fw-bold"style="font-size: x-large"><a class="cat" href="Add_new_Cat.jsp"><%=catcount%></a></div>
                    </div>
                    <% }
            else{
                   
                   }
           rs.close();
           pst.close();
           con.close();
       } catch (Exception e) {
           e.printStackTrace();
       }

                
                    %>

                    <%
                  String user = (String) session.getAttribute("username");
                  int pcount=0;
                  try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                   String sql = "SELECT COUNT(Artist) AS artist_count FROM painting WHERE Artist=?";
                   PreparedStatement pst = con.prepareStatement(sql);
                    pst.setString(1, user);
 
           ResultSet rs = pst.executeQuery();
           if(rs.next()){
                  pcount = rs.getInt("artist_count");

                    %>
                    <div class="col">
                        <a class="paint" href="Manage_Painting.jsp"> <div class="p-4 border bg-warning text-center fw-bold"style="font-size: xx-large">Paintings</div>
                            <div class="p-3 border bg-light text-center fw-bold"style="font-size: x-large"><%=pcount%></div></a>
                    </div>
                    <% }
           else{
                   
                  }
          rs.close();
          pst.close();
          con.close();
      } catch (Exception e) {
          e.printStackTrace();
      }

                
                    %>
                    <%
//                                          String user = (String) session.getAttribute("username");

                   int orcount=0;
              try {
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
               String sql = "SELECT COUNT(Order_ID) AS count FROM web.order where Artist=?";
               PreparedStatement pst = con.prepareStatement(sql);
                                       pst.setString(1, user);

 
       ResultSet rs = pst.executeQuery();
       if(rs.next()){
              orcount= rs.getInt("count");

                    %>

                    <div class="col">
                        <a href="Artist_Order.jsp" class="paint">  <div class="p-4 border bg-warning text-center fw-bold" style="font-size: xx-large">Order</div>
                            <div class="p-3 border bg-light  text-center fw-bold"style="font-size: x-large"><%=orcount%></div></a>

                    </div>
                    <% }
                              else{
                   
                                     }
                             rs.close();
                             pst.close();
                             con.close();
                         } catch (Exception e) {
                             e.printStackTrace();
                         }%>
                </div>

            </div>    
        </div>


    </body>

</html>