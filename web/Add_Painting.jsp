<%-- 
    Document   : Add_Painting
    Created on : 24-Feb-2024, 10:52:51 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%--<%@ page import="jakarta.servlet.http.Part"%>--%>
<%--<%@ page import="jakarta.servlet.annotation.MultipartConfig"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <title>Add Painting</title>
        <style>
            .navbar-brand{
                /*color: white;*/
                font-weight: bolder;
            }
            .navbar-brand:hover{
                color: white;
                text-decoration: underline rgb(255, 215, 0);


            }

            .navbar {

                /*backdrop-filter:blur(5px);*/
                /*background-image:  url("img/bg-8 en.png");*/


            }
            .nav-item>a{
                /*color: white;*/
                font-weight: bold;

            }
            .nav-item>a:hover{
                color: white;
                text-decoration: underline white;

            }
            .newuser {
                font-weight: bolder;
                font-size: x-large;
                text-align: center;

            }
            .add{
                height: 35px;

            }
            .add:hover{
                background-color: aliceblue;
                color: blue;

            }
            .imgadd{
                height: 100px;
                width: 100px;
                overflow: hidden;

            }
            .main{
                     background-image: repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(22.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(157.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),linear-gradient(90deg, rgb(13, 8, 66),rgb(230, 168, 209));

            }
            .section{
                 backdrop-filter:blur(10px);
                background: transparent;
                /*border:1px solid black;*/
            
            }
            .font{
                color: white;
            }
            /*            .container{
                            width: 100%;
                            height: 100vh;
                        }*/
        </style>
    </head>
    <body>
         <%@include file="Artistnav.jsp" %>

        <div class=" main container-fluid border "style="display: flex">

            <form class=" section  p-4 shadow p-3 mt-5 rounded col-8" style="margin:auto;" enctype="multipart/form-data" action="Add_art_sarv" method="post">
                <div class="mb-3 ">
                    <h2 class=" font text-center" style="font-weight: bold;">Add Painting</h2><hr>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class=" font form-label">Painting Name</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" name="Pname" required="Enter Painting Name!">

                </div>
                <div class="mb-3 ">
                    <label for="exampleInputEmail1" class=" font form-label">Description</label>
                    <input type="text" class="form-control" id="exampleInputEmail1"  name="Description" required="Enter Description!">
                </div>
                <div class="mb-3 ">
                    <label for="price1" class="font form-label">Price</label>
                    <input type="text" class="form-control" id="price1" name="price" required="Enter Prices!">
                </div>
                <div class="mb-3 ">
                    <label for="Category1" class="font form-label">Category</label>
                    <select class=" form-select" id="Category1" aria-label="Default select example" name="Category" required>
                        <option  selected >Select Category</option>
                        <%
                try {
//            String user = (String) session.getAttribute("username");
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
       String sql = "SELECT  Category FROM category";
       PreparedStatement pst = con.prepareStatement(sql);
       ResultSet rs = pst.executeQuery();
            
       while (rs.next()) {
                    
                    
                        %>

                        <option value="<%= rs.getString("Category") %>"><%= rs.getString("Category") %></option>

                          <%
       }%>
                    </select>

     <%  rs.close();
       pst.close();
       con.close();
   } catch (Exception e) {
       e.printStackTrace();
   }
                    %>
            
                </div>
                <div class="mb-3 ">
                    <label for="Image" class="font form-label">Image</label>
                    <input type="file" class="form-control" id="Image" name="artimage" accept="image/png, image/jpeg" required="Upload Painting">
                </div>

                <div class="mb-3 text-center">
                    <input class="add btn btn-primary" type="submit" value="Add" style="width: 350px">
                </div>
            </form>

        </div>

    </body>
</html>
