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
        <link rel="stylesheet" href="Css/navcss.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/brands.min.css" integrity="sha512-8RxmFOVaKQe/xtg6lbscU9DU0IRhURWEuiI0tXevv+lXbAHfkpamD4VKFQRto9WgfOJDwOZ74c/s9Yesv3VvIQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }
            .input-text{
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
                background: rgb(169,241,223);
                background: radial-gradient(circle, rgba(169,241,223,1) 41%, rgba(255,187,187,1) 69%);
            }
            .sec1{
                background: rgb(169,241,223);
                background: radial-gradient(circle, rgba(169,241,223,1) 41%, rgba(255,187,187,1) 69%);

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
        </style>
        <title>Painting</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light ">
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
                            <a class="nav-link " aria-current="page" href="../index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Home_Painting.jsp">Paintings</a>
                        </li>
                        <li class="nav-item dropdown">
                            <!--                        <a class="nav-link" href="Login_page.html" aria-current="page">Login</a>-->
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Select User
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="../Login_page.html">User</a></li>
                                <li><a class="dropdown-item" href="../Login_Artist.html">Artist</a></li>
                                <!--                                <li><hr class="dropdown-divider"></li>
                                                                <li><a class="dropdown-item" href="Admin_Login.jsp">Admin</a></li>-->
                            </ul>

                        </li>

                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-3" type="search" id="searchInput" placeholder="Search" aria-label="Search" onkeyup="searchPaintings()">
                    </form>

                </div>
            </div>
        </nav>
        <div class="panel">
            <div class="sec1 border border p-4 shadow p-3 mb-5 bg-body-tertiary rounded">
                <div class="text-center "style="font-weight: bolder;font-size: xx-large">All Painting</div>
            </div>

            <div class="container "  >
                <div class="card-header my-3 "></div>
                <div class="row ">
                    <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                        String sql = "SELECT Name, Description, Prices, Category, Painting, Artist FROM painting";
                        PreparedStatement pst = con.prepareStatement(sql);
                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                    %>

                    <div class="col-md-3 my-3" >
                        <div class="card w-100  border border  shadow  bg-body-tertiary rounded" style="width: 18rem; ">
                            <img class="card-img-top" src="../images/<%= rs.getString("Painting")%>" alt="Product Image" style="height: 300px;width: 305px">
                            <div class="card-body">
                                <h3 class="card-title"><b>Name: </b><%= rs.getString("Name")%></h3>
                                <p class="Description"><b>Description:</b> <%= rs.getString("Description")%></p>
                                <p class="Artist"><b>Artist :</b> <%= rs.getString("Artist")%></p>
                                <p class="category"><b>Category : </b><%= rs.getString("Category")%></p>
                                <p class="price"><b>Rs.</b> <%= rs.getString("Prices")%></p>
                                <div class="mt-3 d-flex justify-content-between">
                                    <a href="../Login_page.html" class="btn btn-dark">Add to cart</a>
                                    <a href="../Login_page.html" class="buy btn btn-primary">Buy Now</a>

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
