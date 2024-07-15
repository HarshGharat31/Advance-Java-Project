<%-- 
    Document   : Artist_Order
    Created on : 05-Mar-2024, 11:43:54 pm
        Author     : hp
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="Css/navcss.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <style>
            .newuser {
                font-weight: bolder;
                font-size: x-large;
                text-align: center;

            }
            .form-label{
                color: white;
            }
            .info img{
                height: 180px;
                width: 170px;
                /*background-size:cover;*/
                overflow: hidden;
                object-fit: cover;

            }
            .info>label{
                font-weight: bolder;
                font-size: x-large;
            }
            .infod{
                font-weight: bold;
                color: white;
            }
             .main{
                     background-image: repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(22.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(157.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),linear-gradient(90deg, rgb(13, 8, 66),rgb(230, 168, 209));

            }
            .Details{
                 backdrop-filter:blur(10px);
                background: transparent;
                /*border:1px solid black;*/
            
            }
           

        </style>
    </head>
    <body>
        <%@include file="Artistnav.jsp" %>

        <div class="main">
        <div>

            <form action="Sold_out" method="post" class="" style="">
                <div class="mb-3 ">
                    <h2 class="text-center" style="color: white;">Orders</h2><hr>
                </div>
                <div class="Details  p-4 shadow p-3  rounded" style="display: flex ">
                    <div class="info mb-3    col-1 text-center ">
                        <label  class="form-label">Order No</label><hr>
                    </div>

                    <div class="info mb-3 col-3 text-center">
                        <label class="form-label ">Painting</label><hr>
                    </div>
                    <div class="info mb-3 col-2 text-center">
                        <label  class="form-label ">Name</label><hr>
                    </div>
                    <div class="info mb-3    col-1 text-center ">
                        <label  class="form-label">Username</label><hr>
                    </div>
                    <div class="info mb-3    col-1 text-center ">
                        <label  class="form-label">Address</label><hr>
                    </div>

                    <div class="info mb-3    col-1 text-center ">
                        <label  class="form-label">Payment</label><hr>
                    </div>

                    <div class="info mb-3 col-1 text-center">
                        <label  class="form-label">Prices</label><hr>
                    </div>
                    <div class="info mb-3 col-2 text-center">
                        <label  class="form-label">Action</label><hr>
                    </div>




                </div>
               <%
    try {
        String user = (String) session.getAttribute("username");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
        String sql = "SELECT Order_ID, Painting, Painting_name, Full_Name, Address, Payment_method, Total_prices FROM web.order WHERE Artist=?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, user);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
%>
            <div class="Details  p-4 shadow p-3  rounded" style="display: flex">
                <div class="info mb-3 col-1 text-center">
                    <p class="infod p-5"><%=rs.getString("Order_ID")%></p>
                </div>
                <div class="info mb-3 col-3 text-center">
                    <img src="images/<%=rs.getString("Painting")%>">
                </div>
                <div class="info mb-3 col-2 text-center">
                    <p class="infod p-5"><%=rs.getString("Painting_name")%></p>
                </div>
                <div class="info mb-3 col-1 text-center">
                    <p class="infod p-5"><%=rs.getString("Full_Name")%></p>
                </div>
                <div class="info mb-3 col-1 text-center">
                    <p class="infod p-5"><%=rs.getString("Address")%></p>
                </div>
                <div class="info mb-3 col-1 text-center">
                    <p class="infod p-5"><%=rs.getString("Payment_method")%></p>
                </div>
                <div class="info mb-3 col-1 text-center">
                    <p class="infod p-5" ><%=rs.getString("Total_prices")%></p>
                </div>
                <div class="info mb-3 col-2 text-center">
                    <input type="hidden" value="<%=rs.getString("Order_ID")%>" name="ord_id">
                    <input type="hidden" value="<%=user%>" name="artist">

                    <input class="update mt-5 btn btn-danger" type="submit" value="Sold out">
                </div>
            </div>
<%
        }
        rs.close();
        pst.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace(); // Printing the exception trace for debugging
    }
%>
            </form>

        </div>
        </div>
    </body>
</html>
