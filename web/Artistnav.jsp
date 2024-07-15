<%-- 
    Document   : Artistnav
    Created on : 03-Mar-2024, 11:45:45 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .navbar{
                background-image: linear-gradient(45deg, rgb(240, 99, 99) 0%, rgb(240, 99, 99) 11%,rgb(230, 115, 107) 11%, rgb(230, 115, 107) 24%,rgb(220, 132, 114) 24%, rgb(220, 132, 114) 29%,rgb(210, 148, 122) 29%, rgb(210, 148, 122) 45%,rgb(199, 164, 129) 45%, rgb(199, 164, 129) 87%,rgb(189, 181, 137) 87%, rgb(189, 181, 137) 90%,rgb(179, 197, 144) 90%, rgb(179, 197, 144) 100%),linear-gradient(67.5deg, rgb(240, 99, 99) 0%, rgb(240, 99, 99) 11%,rgb(230, 115, 107) 11%, rgb(230, 115, 107) 24%,rgb(220, 132, 114) 24%, rgb(220, 132, 114) 29%,rgb(210, 148, 122) 29%, rgb(210, 148, 122) 45%,rgb(199, 164, 129) 45%, rgb(199, 164, 129) 87%,rgb(189, 181, 137) 87%, rgb(189, 181, 137) 90%,rgb(179, 197, 144) 90%, rgb(179, 197, 144) 100%),linear-gradient(135deg, rgb(240, 99, 99) 0%, rgb(240, 99, 99) 11%,rgb(230, 115, 107) 11%, rgb(230, 115, 107) 24%,rgb(220, 132, 114) 24%, rgb(220, 132, 114) 29%,rgb(210, 148, 122) 29%, rgb(210, 148, 122) 45%,rgb(199, 164, 129) 45%, rgb(199, 164, 129) 87%,rgb(189, 181, 137) 87%, rgb(189, 181, 137) 90%,rgb(179, 197, 144) 90%, rgb(179, 197, 144) 100%),linear-gradient(90deg, rgb(156, 174, 7),rgb(129, 53, 44)); background-blend-mode:overlay,overlay,overlay,normal;
            }
            .log:hover{
                background-color: wheat;
                color: red;
            }
        </style>
    </head>
    <body>
 <nav class="navbar navbar-expand-lg ">
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
                            <a class="nav-link " aria-current="page" href="Art_dashboard.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Add_Painting.jsp">Paintings</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="Manage_Painting.jsp" aria-current="page">Manage Painting</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="Add_new_Cat.jsp" aria-current="page">Category</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link " href="Artist_Order.jsp" aria-current="page">Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="ArtProfile_Page.jsp" aria-current="page">Profile</a>
                        </li>

                    </ul>
                     <div class="userprofile d-flex">
                        <p class="newuser">Hello, <%= session.getAttribute("username") %>!</p>
                        <form action="LogoutServlet" method="post">
                            <button type="submit" class="btn btn-danger ms-2" style="height: 35px;">Logout</button>
                        </form>
                    </div>

                </div>
            </div>
        </nav>
           </body>
</html>
