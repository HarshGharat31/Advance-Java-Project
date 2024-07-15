
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <title>Payment </title>
        <style>
            .pay_panel{
                margin: auto;
                  background: transparent;
                backdrop-filter:blur(10px);
           
            }
            p{
                font-weight: bolder;
            }
            
        </style>
    </head>
    <body>
        <%@include file="usernav.jsp"%>
        <div class="container-fluid" style="height: 150vh;background-image: linear-gradient(90deg, rgb(209, 209, 209),rgb(207, 207, 207)),linear-gradient(45deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%),linear-gradient(135deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%); background-blend-mode:overlay,overlay,normal;">  
            <div class="text-center"><h2>Payment</h2><hr></div>
            <form action="Ordersarv" method="post">
                <div class="pay_panel  border border p-4 shadow p-3 mb-5  rounded col-6 justify-content-center">
                    <div class="pro_img">
                        <img  class=" border border-dark shadow  mb-5 bg-body-tertiary rounded" src="images/${imgname}" style="height: 200px;width: 200px;">
                    </div>
                        <input type="hidden" value="${imgname}" name="imgpath">
                      
                    <div class="user_name">
                                     <%!
                // JDBC variables
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rs = null;
            %>
            <%
                String user = (String) session.getAttribute("username");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                    String sql = "SELECT Full_Name, Address,username FROM user WHERE username=?";
                    pst = con.prepareStatement(sql);
                    pst.setString(1,user);
                    rs = pst.executeQuery();
                    // Retrieve user information
                    if(rs.next()) {
            %>
            <input type="hidden" value="<%= rs.getString("username") %>"  name="user1">
                        <div class="user_name">
                            <p>Name <input type="text" class="form-control" value="<%= rs.getString("Full_Name") %>" readonly name="username"></p>
                        </div>
                        <div class="userAdd">
                            Address<input class="form-control" type="text" value="<%= rs.getString("Address") %>" name="add" required>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close resources in finally block
                    try {
                        if (rs != null) rs.close();
                        if (pst != null) pst.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
            
                   
                    </div>
                    <div class="pro_name">
                        <p>Painting Name <input class="form-control" type="text" value="${patname}" name="Painting_name" readonly></p>
                    </div>
                    <div class="price">
                        <p>Prices<input type="text" value=" Rs.${btnprices}.00" name="prices" readonly class="form-control"></p>
                    </div>
                    <div class="payment">
                        <p>Payment Method</p>
                        <select class="form-select" aria-label="Default select example" name="pay">
                           <option selected>Open this select Payment method</option>
                            <option value="Cash On Delivery">Cash on Delivery</option>
                           <option value="Card"> Debit/Credit Card</option>
                        </select> 
                    </div>
                    
                    
                    <input type="hidden" value="${btnArtist}" name="artist" >
                    <div class="sumbit my-3">
                        <input class="btn btn-primary" type="submit" value="Place Your Order" style="width: 300px;height: 45px;">
                    </div>

                </div>
            </form>

        </div>
                     
    </body>
</html>
