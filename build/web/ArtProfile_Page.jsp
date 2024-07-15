<%-- 
    Document   : ArtProfile_Page
    Created on : 22-Feb-2024, 8:10:29 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Artist Profile</title>
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

            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }
            .userprofile{
                display: flex;
            }
            .userprofile p{
                justify-self: center;
            }
            /*            .userprofile a{
                            text-decoration: none;
                        }*/
            .fa-solid{
                margin-top:18px;
            }
            .profile-box{
                align-items: center;

            }
            .input-text{
            }
            .tname{
                font-weight: bolder;
                font-size: x-large;
                color: white;


            }
            .info{
                margin-left: 15px;
                font-size: x-large;
                color: white;
                /*box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2);*/
                background: transparent;
                border: none;

            }
            .update{
                width: 150px;
            }
            .logout{
                width: 150px;
            }
            .update:hover{
                background-color: aliceblue;
                color: blue;
            }
            .logout:hover{
                background-color: aliceblue;
                color: blue;

            }
              .main{
                height: 100vh;
                width: 100%;
                background-image: repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(22.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(157.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),linear-gradient(90deg, rgb(13, 8, 66),rgb(230, 168, 209));

            }
            .section{
                 backdrop-filter:blur(10px);
                background: transparent;
                
            }
        </style>
    </head>
    <body>
        <%@include file="Artistnav.jsp" %>
        <div class="main">
            <div class="profile-box">
                <h1 class="text-center"style="font-weight: bold;color: white;">Profile</h1><hr>




                <form action="Artist_pro_update" method="post">
                    <%
                        try {
                            String user = (String) session.getAttribute("username");
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                            String sql = "SELECT Full_Name, Shop_Name, Mobile_Number, City, State, Address, Pincode, Email_ID FROM artist WHERE Username=?";
                            PreparedStatement pst = con.prepareStatement(sql);
                            pst.setString(1, user);
                            ResultSet rs = pst.executeQuery();
            
                            while (rs.next()) {
                    %>
                    <div class="container" >
                        <div class="section p-4 shadow p-3  rounded" style="margin: auto;">
                            <div class="mb-3   ">
                                <label class="tname">Full Name :</label><input type="text" class="info" value="<%= rs.getString("Full_Name") %>" name="fname">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" >Shop Name :<input type="text" class="info" value="<%= rs.getString("Shop_Name") %>" name="shop">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Mob No :<input type="text" class="info" value="<%= rs.getString("Mobile_Number") %>" name="mob">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Email Id :<input type="text" class="info" value="<%= rs.getString("Email_ID") %>" name="email">
                            </div>

                            <div class="mb-3 ">
                                <label class="tname" > City :<input type="text" class="info" value="<%= rs.getString("City") %>" name="city">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" >  State :<input type="text" class="info" value="<%= rs.getString("State") %>" name="state">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Address :<input type="text" class="info" value="<%= rs.getString("Address") %>" name="address">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Pin-code :<input type="text" class="info" value="<%= rs.getString("Pincode") %>" name="pin">
                                    <input type="hidden" value="<%=user%>"   name="user1" >
                            </div>
                            <div class="mb-3 text-center">
                                <a href="index.html"> <input class="logout btn btn-primary" type="button" value="Logout"></a>&nbsp;&nbsp;&nbsp;
                                <input class="update btn btn-success" type="submit" value="Update">

                            </div>

                        </div>
                    </div>
                    <%
                            }
                            rs.close();
                            pst.close();
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </form>      
            </div>
        </div>

    </body>
</html>
