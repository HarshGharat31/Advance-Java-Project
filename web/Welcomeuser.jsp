<%-- 
    Document   : Welcomeuser
    Created on : 22-Feb-2024, 10:09:38 am
    Author     : hp
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <title>Home</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--        <link rel="stylesheet" href="Css/navcss.css">-->
        <style>
            .mySlides {
                display: none;
            }
            .mySlides{
                overflow: auto;
                object-fit: cover;
                display: flex;
            }
            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }

        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <%@include file="usernav.jsp" %>
         <div class="content " style="height:100vh">
            <img class="mySlides" src="img/painting1.jpg"  style="width:100%;height:100vh;">
            <img class="mySlides" src="img/P1.jpg" style="width:100%;height:100vh;">
            <img class="mySlides" src="img/p2.jpg"style="width:100%;height:100vh;">
            <img class="mySlides" src="img/p3.jpg" style="width:100%;height:100vh;">
        </div>
       ​
        <script>
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1;
                }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 2000); // Change image every 2 seconds
            }
        </script>

    </body>

</html>