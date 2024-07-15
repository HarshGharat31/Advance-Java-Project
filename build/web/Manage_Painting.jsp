<%-- 
    Document   : Manage_Painting
    Created on : 25-Feb-2024, 9:59:12 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage painting</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="Css/navcss.css">
        <style>
            .info{
                font-weight: bolder;
                font-size: large;
                /*color: white;*/
            }
            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }
            .info img{
                height: 180px;
                width: 170px;
                /*background-size:cover;*/
                overflow: hidden;
                object-fit: cover;

            }
            .main{
                background-image: repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(22.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(45deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(157.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(112.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(67.5deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(135deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),repeating-linear-gradient(90deg, hsla(253,0%,98%,0.03) 0px, hsla(253,0%,98%,0.03) 1px,transparent 1px, transparent 12px),linear-gradient(90deg, rgb(13, 8, 66),rgb(230, 168, 209));
            }
            .Details{
                /*backdrop-filter:blur(10px);*/
                background-color: aliceblue;

            }
        </style>
    </head>
    <body>
        <%@include file="Artistnav.jsp" %>
        <div class="main">
            <div class=" container-fluid ">
                <form class="wrapper" >
                    <div class="title">
                        <h2 class="text-center shadow p-3" style="color: white;font-weight: bolder;font-size: xx-large;">Painting Details</h2><hr>
                    </div>

                    <div class="Details  p-4 shadow  p-3   rounded" style="display: flex ">
                        <div class="info  col-3 text-center">
                            <label class="form-label ">Image</label>
                        </div>
                        <div class="info  col-2 text-center">
                            <label  class="form-label ">Name</label>
                        </div>
                        <div class="info    col-1 text-center ">
                            <label  class="form-label">Description</label>
                        </div>
                        <div class="info    col-2 text-center ">
                            <label  class="form-label">Category</label>
                        </div>

                        <div class="info  col-2 text-center">
                            <label  class="form-label">Prices</label>
                        </div>
                        <div class="info  col-2 text-center">
                            <label  class="form-label">Action</label>
                        </div>
                        <hr>
                    </div>
                    <%
                        try {
                        
    //                        String imagename=(String)request.getAttribute("imgname");
                            String user = (String) session.getAttribute("username");
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                            String sql = "SELECT P_ID,Name,Description,Prices,Category,Painting FROM painting WHERE Artist=? ";
                            PreparedStatement pst = con.prepareStatement(sql);
                            pst.setString(1, user);
    //                        pst.setString(2,imagename);
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                        
                            

                    %>  
                    <div class="Details  p-4 shadow p-3  rounded " style="display: flex">
                        <div class="info  col-3 text-center">
                            <img src="images/<%= rs.getString("Painting")%>"/>
                        </div>
                        <div class="info  col-2 text-center">
                            <p class="p-5"><%= rs.getString("Name")%></p>
                        </div>
                        <div class="info    col-1 text-center ">
                            <p class="p-5"><%= rs.getString("Description")%></p>
                        </div>
                        <div class="info  col-2 text-center">
                            <p class="p-5"><%= rs.getString("Category")%></p>
                        </div>
                        <div class="info  col-2 text-center">
                            <p class="p-5"><%= rs.getString("Prices")%></p>
                        </div>
                        <div class="info p-5 col-2 text-center d-flex">
                            <form action="ForwardUpdateFormServlet" method="post">
                                <input type="hidden" value="<%= rs.getString("P_ID")%>" name="pan_id">
                                <input type="hidden" value="<%= rs.getString("Name")%>" name="name">
                                <input type="hidden" value="<%= rs.getString("Description")%>" name="Descri">
                                <input type="hidden" value="<%= rs.getString("Category")%>" name="cate">
                                <input type="hidden" value="<%= rs.getString("Prices")%>" name="prices">  
                                <input class="btn btn-primary" type="submit" value="Update" style="height: 38px;width: 80px;">
                            </form>
                            <form action="Delete_Painting_sarv" method="post">
                                <input type="hidden" value="<%= rs.getString("P_ID")%>" name="pan_id">
                                <input class="update ms-1 btn btn-danger" type="submit" value="Delete">
                            </form>
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
        </div>
    </body>
</html>
