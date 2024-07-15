<%-- 
    Document   : Admin_Dashbored
    Created on : 28-Feb-2024, 12:45:58 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dash</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            .imguser{
                height: 200px;
                width: 200px;
                overflow: hidden;
                object-fit: cover;
            }
            .uname{
                font-weight: bolder;
            }
            .Backpanel{
                background: rgb(63,94,251);
                background: radial-gradient(circle, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);
                /*background-image: url("../img/bg-10.jpg");*/
                height: 150vh;
                width: 100%;

                object-fit: cover;

            }
            .add{
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Painting Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../Painting_page.jsp">Paintings</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="Admin_Dashbored.jsp" aria-current="page">Admin</a>
                        </li>
                    </ul>
                    <div class="text-center"><h2 style="font-weight: bolder;font-size: xx-large"> Welcome,<%=session.getAttribute("username")%></h2></div><hr>

                </div>
            </div>
        </nav>

        <div class="Backpanel">
            <div class="row-2 text-center h1 " style="font-weight: bolder; ">DashBoard</div><hr>
            <div class="container-fluid " style="display: flex;">
                <%
                       int userno=0;
                  try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                   String sql = "SELECT COUNT(Email_ID) AS user_count FROM user";
                   PreparedStatement pst = con.prepareStatement(sql);
                     
 
           ResultSet rs = pst.executeQuery();
           if(rs.next()){
                  userno = rs.getInt("user_count");

                %>
                <div class='col-1'></div>

                <div class="sec text-center border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded col-2 ">
                    <img class="imguser" src="../img/profile_3135715.png">
                    <p class="uname" style="font-size: x-large">Active User</p>
                    <h3 class="usercount"style="font-weight: bolder"><%=userno%></h3>
                </div>
                <div class='col-2'></div>

                <% }
          else{
                   
                 }
         rs.close();
         pst.close();
         con.close();
     } catch (Exception e) {
         e.printStackTrace();
     }%>


                <%
                               int artno=0;
                          try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                           String sql = "SELECT COUNT(Email_ID) AS art_count FROM artist";
                           PreparedStatement pst = con.prepareStatement(sql);
                     
 
                   ResultSet rs = pst.executeQuery();
                   if(rs.next()){
                          artno = rs.getInt("art_count");

                %>

                <div class="sec text-center border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded col-2 ">
                    <img class="imguser" src="../img/artist_5510498.png">
                    <p class="uname" style="font-size: x-large;font-weight: bolder;">Active Artist</p>
                    <h3><%=artno%></h3>
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
                <div class='col-2'></div>
                <%
               int procount=0;
          try {
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
           String sql = "SELECT COUNT(Painting) AS p_count FROM painting";
           PreparedStatement pst = con.prepareStatement(sql);
                     
 
   ResultSet rs = pst.executeQuery();
   if(rs.next()){
          procount= rs.getInt("p_count");

                %>

                <div class="sec text-center border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded col-2 ">
                    <a class="add" href="../Painting_page.jsp"> <img class="imguser" src="../img/6892856.png">
                    <p class="uname" style="font-size: x-large;font-weight: bolder;">Products</p></a>
                    <h3><%=procount%></h3>
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


            <div  class="container-fluid " style="display: flex">

                <div class='col-1'></div>
                <%
                     int catcount=0;
                try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                 String sql = "SELECT COUNT(Category) AS cat_count FROM category";
                 PreparedStatement pst = con.prepareStatement(sql);
                     
 
         ResultSet rs = pst.executeQuery();
         if(rs.next()){
                catcount= rs.getInt("cat_count");

                %>
                <div class="sec text-center border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded col-2 ">
                    <a class="add" href="../Add_new_Cat.jsp"> <img class="imguser" src="../img/cate.png">
                    <p class="uname" style="font-size: x-large">Category</p></a>
                    <h3 class="usercount" style="font-weight: bolder"><%=catcount%></h3>
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

                <div class='col-2'></div>
                
                <div class="sec text-center border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded col-2 ">
                    <img class="imguser" src="../img/10608883.png">
                    <p class="uname" style="font-size: x-large">Add Products</p>
<!--                    <h3 class="usercount"style="font-weight: bolder"><%=userno%></h3>-->
                    <a class="add" href="../Add_Painting.jsp"><input type="button" class="btn btn-primary" value="Add" style="width: 100px;height: 45px;"></a>
                </div>
                <div class='col-2'></div>
                 <%
                     int orcount=0;
                try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                 String sql = "SELECT COUNT(Order_ID) AS count FROM web.order";
                 PreparedStatement pst = con.prepareStatement(sql);
                     
 
         ResultSet rs = pst.executeQuery();
         if(rs.next()){
                orcount= rs.getInt("count");

                %>
               
                <div class="sec text-center border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded col-2 ">
                    <img class="imguser" src="../img/order-placed-purchased-icon.webp" style="object-fit: cover;height: 175px;width: 175px;">
                    <p class="uname" style="font-size: x-large">Total Order</p>
                       <h3 class="usercount"style="font-weight: bolder"><%=orcount%></h3>
                    
                       <a href="View_Orders.jsp"> <input class="btn btn-primary" value="View Orders" ></a>
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
                <div class='col-2'></div>


            </div>         

        </div>



    </body>
</html>
