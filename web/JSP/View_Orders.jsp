<%-- 
    Document   : View_Orders
    Created on : 11-Mar-2024, 2:28:08 pm
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View orders</title>
        <link rel="stylesheet" href="../Css/navcss.css">
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
                            <a class="nav-link" href="All_Products.jsp">Paintings</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="Admin_Dashbored.jsp" aria-current="page">Admin</a>
                        </li>
                    </ul>
                    <div class="text-center"><h2 style="font-weight: bolder;font-size: xx-large"> Welcome,<%=session.getAttribute("username")%></h2></div><hr>

                </div>
            </div>
        </nav>

        <!--Order_ID, Painting, Painting_name, Payment_method, Total_prices, Username, Address, Artist, Full_Name-->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Sr no</th>
                    <th scope="col">Order ID</th>
                    <th scope="col">Painting</th>
                    <th scope="col">Painting name</th>
                    <th scope="col">Payment method</th>
                    <th scope="col">Prices</th>
                    <th scope="col">Customer Name</th>
                     <th scope="col">Address</th>
                    <th scope="col">Artist</th>

                </tr>
            </thead>
            <tbody>
                <%
                  try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                           String sql = "SELECT Order_ID, Painting, Painting_name, Payment_method, Total_prices,Address, Artist, Full_Name FROM web.order";
                           PreparedStatement pst = con.prepareStatement(sql);
                   ResultSet rs = pst.executeQuery();
                   int rowCount = 0; // Variable to count rows
                   while(rs.next()){
                   rowCount++;               
%>

                <tr>
                    <th scope="row"><%=rowCount%></th>
                    <td><%=rs.getString("Order_ID")%></td>
                    <td><img src="../images/<%=rs.getString("Painting")%>" style="height: 100px;width: 100px;"></td>
                    <td><%=rs.getString("Painting_name")%></td>
                    <td><%=rs.getString("Payment_method")%></td>
                    <td><%=rs.getString("Total_prices")%></td>
                    <td><%=rs.getString("Full_Name")%></td>
                     <td><%=rs.getString("Address")%></td>
                    <td><%=rs.getString("Artist")%></td>

                </tr>
                 <% }
            
                   
                   
           rs.close();
           pst.close();
           con.close();
       } catch (Exception e) {
           e.printStackTrace();
       }%>
            </tbody>

        </table>



    </body>
</html>
