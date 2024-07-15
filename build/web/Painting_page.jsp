<%-- 
    Document   : Painting_page
    Created on : 24-Feb-2024, 12:28:35 pm
    Author     : hp
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="Css/navcss.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/brands.min.css" integrity="sha512-8RxmFOVaKQe/xtg6lbscU9DU0IRhURWEuiI0tXevv+lXbAHfkpamD4VKFQRto9WgfOJDwOZ74c/s9Yesv3VvIQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            /*            .newuser{
                            font-weight: bolder;
                            font-size: x-large;
                            text-align: center;
                        }
            */            .input-text{
            }

            .product {
                margin-bottom: 20px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            /*    .product img {
                  max-width: 400px;
                  height: 400px;
                }*/
            .btn-buy {
                background-color: #28a745;
                color: #fff;
            }
            .btn-add-to-cart {
                background-color: #007bff;
                color: #fff;
            }
            body{

            }
            .panel{
                background-image: linear-gradient(90deg, rgb(209, 209, 209),rgb(207, 207, 207)),linear-gradient(45deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%),linear-gradient(135deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%);
                background-blend-mode:overlay,overlay,normal;
                /*background: transparent;*/
            }
            .container{
                display: flex;

            }
            .buy:hover{
                background-color:#28a745;
            }
            /*            .card{
                            background: transparent;
                            backdrop-filter:blur(8px);
                        }*/
            .zoom{

            }
            .zoom:hover{
                transform: scale(1.1); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */

            }
            @media(max-width:100%){
                .panel{
                }
                .card{

                }
                .card-img-top{

                }
            }
        </style>
        <title>Painting</title>
    </head>
    <body>
        <%@include file="usernav.jsp" %>

        <div class="panel">
            <div class="sec1 border border p-4 shadow p-3 mb-5  rounded">
                <div class="text-center "style="font-weight: bolder;font-size: xx-large">All Painting</div>
            </div>

            <div class="container "  >
                <div class="card-header my-3 "></div>
                <div class="row ">
                    <%
                            String user = (String) session.getAttribute("username");

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                        String sql = "SELECT P_ID,Name, Description, Prices, Category, Painting, Artist FROM painting";
                        PreparedStatement pst = con.prepareStatement(sql);
                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                        
                    %>
                    <div class="zoom col-md-3 my-3" >
                        <div class="card w-100  border border  shadow  bg-body-tertiary rounded" style="width: 18rem; ">
                            <form action="Add_to_Cart_sarv" method="post">

                                <img class=" card-img-top" src="images/<%= rs.getString("Painting")%>"   alt="Product Image" style="height: 300px;width: 305px">
                                <div class="card-body">
                                    <label><b>Name: </b></label> <input type="text" readonly class="card-title " name="pname" value="<%= rs.getString("Name")%>" style="border: none;background: transparent;"> 
                                    <p class="Description"><b>Description:</b> <%= rs.getString("Description")%></p>
                                    <label><b>Artist :</b></label> <input type="text" name="Artist" readonly class="Artist" value="<%= rs.getString("Artist")%>" style="border: none;background: transparent;">
                                    <p class="category"><b>Category : </b><%= rs.getString("Category")%></p>
                                    <label class="price"><b>Rs.</b> </label><input type="text" readonly value="<%= rs.getString("Prices")%>.00" name="prices" style="border: none;background: transparent;">
                                    <input type="hidden" name="p-img" value="<%= rs.getString("Painting")%>">
                                    <div class="mt-3 d-flex justify-content-between">
                                    <input type="submit" class="btn btn-dark" value="Add Cart">
                               </form> 
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                        <form action="Paymentsarv" method="post">
                                            <input type="hidden" value="<%= rs.getString("Painting")%>" name="imgname">
                                            <input type="hidden" value="<%= rs.getString("Name")%>" name="patname">
                                            <input type="hidden" value="<%= rs.getString("Artist")%>" name="btnArtist">
                                            <input type="hidden" value="<%= rs.getString("Prices")%>" name="btnprices">
                                            <input type="hidden" value="<%= rs.getString("P_ID")%>" name="Id">
                                            <input type="hidden" value="<%=user%>" name="username">
                                            <input type="submit" class="buy btn btn-primary" value="Buy Now">
                                        </form>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <%  
                }
                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
                    
                    %>

                </div>
            </div>
        </div>
        <script>
            function searchPaintings() {

                var input = document.getElementById('searchInput').value.toLowerCase();


                var cards = document.getElementsByClassName('col-md-3');


                for (var i = 0; i < cards.length; i++) {
                    var card = cards[i];
                    var name = card.querySelector('.card-title').innerText.toLowerCase();
                    var description = card.querySelector('.Description').innerText.toLowerCase();
                    var artist = card.querySelector('.Artist').innerText.toLowerCase();
                    var category = card.querySelector('.category').innerText.toLowerCase();


                    if (name.includes(input) || description.includes(input) || artist.includes(input) || category.includes(input)) {

                        card.style.display = 'block';
                    } else {

                        card.style.display = 'none';
                    }
                }
            }
        </script>

    </body>
</html>
