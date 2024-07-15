<%-- 
    Document   : Add_to_Cart
    Created on : 29-Feb-2024, 12:00:04 pm
    Author     : hp
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<link rel="stylesheet" href="Css/navcss.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/brands.min.css" integrity="sha512-8RxmFOVaKQe/xtg6lbscU9DU0IRhURWEuiI0tXevv+lXbAHfkpamD4VKFQRto9WgfOJDwOZ74c/s9Yesv3VvIQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Carts</title>
        <style>
/*            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }*/
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre,.btn-decre{
                box-shadow: none;
                font-size:25px;
            }
             .section{
                 backdrop-filter:blur(10px);
                /*background: transparent;*/
                /*border:1px solid black;*/
            
            }
           
        </style>
    </head>
    <body>
        <%@include file="usernav.jsp" %>
        <div style="background-image: linear-gradient(90deg, rgb(209, 209, 209),rgb(207, 207, 207)),linear-gradient(45deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%),linear-gradient(135deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%); background-blend-mode:overlay,overlay,normal;height: 100vh;">
        <div class="container" >

            <%
                String u = (String) session.getAttribute("username");
                int totalPrices = 0; 

              try{
                     Class.forName("com.mysql.cj.jdbc.Driver");
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                     String sql = "SELECT idcart,PName,Painting,Prices,Artist FROM cart where user=?";
                     PreparedStatement pst = con.prepareStatement(sql);
                     pst.setString(1,u);
                     ResultSet rs = pst.executeQuery();
                       
               
            %>

            <table class="section table table-loght ">
                <thead class=" p-4 shadow p-3 mt-5 rounded">
                    <tr>
                        <th scope="col">Painting</th>
                        <th scope="col">Name</th>
                        <th scope="col">Artist</th>
                        <th scope="col">Prices</th>
                        <th scope="col">Buy Now</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <%   while (rs.next()) {
                    %>
                    <tr >
                        <td><img class="border "src="images/<%= rs.getString("Painting")%>" alt="painting not Load" style="width: 100px;height: 100px;"/></td>
                        <td><%= rs.getString("PName")%></td>
                        <td><%= rs.getString("Artist")%></td>
                        <td><%= rs.getInt("Prices")%></td>
                <form action="Add_cart_buynow" method="post">
                    <input type="hidden" value="<%= rs.getString("Painting")%>" name="imgname">
                    <input type="hidden" value="<%= rs.getString("PName")%>" name="patname">
                    <input type="hidden" value="<%= rs.getString("Artist")%>" name="btnArtist">
                    <input type="hidden" value="<%= rs.getString("Prices")%>" name="btnprices">
                    <input type="hidden" value="<%=u%>" name="username">

                    <td> <input type="submit" class="buy btn btn-primary" value="Buy Now"> </td>
                </form>

                <form action="Delete_Painting" method="post">
                    <input type="hidden" value="<%= rs.getString("idcart")%>" name="pid">
                    <input type="hidden" value="<%=u%>" name="user12">
                    <td><input type="submit" class="btn btn btn-danger"  value="Remove"></td>
                </form>
                </tr>

                <%  
                       totalPrices += rs.getInt("Prices"); 

           }
           rs.close();
           pst.close();
           con.close();
       } catch (Exception e) {
           out.println(e);
       }
                    
                %>
                </tbody>
            </table>
            <div class="d-flex py-3"><h3>Total Prices: Rs. <%= totalPrices %></h3></div>

        </div>

        </div>
    </body>
</html>
