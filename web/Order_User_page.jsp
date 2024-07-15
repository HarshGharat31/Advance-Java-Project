<%-- 
    Document   : Order_User_page
    Created on : 05-Mar-2024, 10:31:06 pm
    Author     : hp
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
        <title>Order</title>
        <style>
/*             .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }*/
            .info img{
                height: 180px;
                width: 170px;
                /*background-size:cover;*/
                overflow: hidden;
                object-fit: cover;

            }
            .form-label{
                font-weight: bolder;
                font-size: x-large;
            }
           
        </style>
    </head>
    <body>
               <%@include file="usernav.jsp" %>

        
            <div style="background: rgb(204,251,255);background: linear-gradient(318deg, rgba(204,251,255,1) 50%, rgba(239,150,197,1) 84%);height: 100vh;" >
                
            <form action="Cancel_Order" method="post" class=" " >
                <div class="mb-3 ">
                    <h2 class="text-center">Orders</h2><hr>
                </div>
                <div class="Details border border p-4 shadow p-3  bg-body-tertiary rounded" style="display: flex ">
                    <div class="info  col-3 text-center">
                        <label class="form-label ">Painting</label><hr>
                    </div>
                    <div class="info  col-2 text-center">
                        <label  class="form-label ">Name</label><hr>
                    </div>
<!--                    <div class="info mb-3    col-1 text-center ">
                        <label  class="form-label">Description</label><hr>
                    </div>-->
                    <div class="info    col-2 text-center ">
                        <label  class="form-label">Payment Method</label><hr>
                    </div>

                    <div class="info  col-2 text-center">
                        <label  class="form-label">Prices</label><hr>
                    </div>
                    <div class="info  col-3 text-center">
                        <label  class="form-label">Action</label><hr>
                    </div>

                </div>
                  <%
                    try {
                        
//                        String imagename=(String)request.getAttribute("imgname");
                        String user = (String) session.getAttribute("username");
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                        String sql = "SELECT Order_ID,Painting,Painting_name,Total_prices,Payment_method from web.order WHERE Username=? ";
                        PreparedStatement pst = con.prepareStatement(sql);
                        pst.setString(1, user);
//                        pst.setString(2,imagename);
                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                        
                            

                %>  
               
                 
                   <div class="Details border border p-4 shadow p-3  bg-body-tertiary rounded " style="display: flex">
                    <div class="info  col-3 text-center">
                        <img src="images/<%= rs.getString("Painting")%>" />
                    </div>
                    <div class="info  col-2 text-center">
                        <p><%= rs.getString("Painting_name")%></p>
                    </div>
                    <div class="info     col-2 text-center ">
                        <p><%= rs.getString("Payment_method")%></p>
                    </div>
                    <div class="info  col-2 text-center">
                        <p><%= rs.getString("Total_prices")%></p>
                    </div>
                    
                    <div class="info  col-3 text-center">
                        <input type="hidden" value="<%= rs.getString("Order_ID")%>" name="o_id">
                        <input type="hidden" value="<%=user%>" name="user56">

                        <!--<input class="update btn btn-primary" type="button" value="Update">-->
                        <input class=" btn btn-danger" type="submit" value="Cancel Order">


                    </div>
                    <hr>
                </div>


            </form>
             <%  } 
                    rs.close();
                    pst.close();
                    con.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
                
            %>
          
        </div>
    </body>
</html>
