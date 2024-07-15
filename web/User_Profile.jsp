<%-- 
    Document   : User_Profile
    Created on : 24-Feb-2024, 10:01:59 pm
    Author     : hp
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <!--<link rel="stylesheet" href="Css/navcss.css">-->
        <style>
/*            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }*/
            .tname{
                font-weight: bolder;
                font-size: x-large;


            }
            .info{
                height: 35px;
                width: 350px;
                margin-left: 15px;
                font-size: x-large;
                border: none;
                background: transparent;

                /*box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2);*/


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
            .userinter{
                background: transparent;
                backdrop-filter:blur(10px);
                animation: mymove 1s;
            }
            @keyframes mymove {
  50% {opacity: 0;}
}

        </style>
        <title>Profile</title>
    </head>
    <body>
               <%@include file="usernav.jsp" %>

               <div style="height: 100vh;background-image: linear-gradient(90deg, rgb(209, 209, 209),rgb(207, 207, 207)),linear-gradient(45deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%),linear-gradient(135deg, rgb(177, 223, 206) 0%, rgb(177, 223, 206) 46%,rgb(147, 192, 214) 46%, rgb(147, 192, 214) 56%,rgb(117, 162, 222) 56%, rgb(117, 162, 222) 61%,rgb(86, 131, 229) 61%, rgb(86, 131, 229) 64%,rgb(56, 101, 237) 64%, rgb(56, 101, 237) 82%,rgb(26, 70, 245) 82%, rgb(26, 70, 245) 100%); background-blend-mode:overlay,overlay,normal;">  
            <div>
                <hr> <h1 class="text-center"style="font-weight: bold">Profile</h1><hr>

                <%
                    try {
                        String user = (String) session.getAttribute("username");
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
                        String sql = "SELECT Full_Name, Mobile_no, City, State, Address, Pin_code, Email_ID FROM user WHERE username=?";
                        PreparedStatement pst = con.prepareStatement(sql);
                        pst.setString(1, user);
                        ResultSet rs = pst.executeQuery();
                        while(rs.next()){
                            
                %>
                <form action="Update_Profile" method="post">

                    <div class="container">
                        <div class="userinter border border p-4 shadow p-3 mb-5  rounded">
                            <div class="mb-3   ">
                                <label class="tname">Full Name :</label><input class="info " type="text" value="<%= rs.getString("Full_Name") %>"  >
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Mob No :</label><input class="info " type="text" value="<%= rs.getString("Mobile_no") %>">
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Email Id :</label><input class="info " type="email" value="<%= rs.getString("Email_ID") %>"  >
                            </div>

                            <div class="mb-3 ">
                                <label class="tname" > City :</label><input class="info " type="text" value="<%= rs.getString("City") %>"  >
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" >  State :</label><input class="info " type="text" value="<%= rs.getString("State") %>"  >
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Address :</label><input class="info " type="text" value="<%= rs.getString("Address") %>" >
                            </div>
                            <div class="mb-3 ">
                                <label class="tname" > Pin-code :</label><input class="info " type="text" value="<%= rs.getString("Pin_code") %>" name="pin" >
                            </div>
                            <div class="mb-3 text-center">
                                <a href="index.html"> <input class="logout btn btn-primary" type="button" value="Logout"></a>&nbsp;&nbsp;&nbsp;
                                <!--<form action="Sarvlet\Update_Profile.java" method="post">-->
                                <input type="hidden" value="<%=user%>" name="user12">
                                <input class="info " type="hidden" value="<%= rs.getString("Full_Name") %>" name="fname" >
                                <input class="info " type="hidden" value="<%= rs.getString("Mobile_no") %>" name="con_no" >
                                <input class="info " type="hidden" value="<%= rs.getString("Email_ID") %>" name="email_id" >
                                <input class="info " type="hidden" value="<%= rs.getString("City") %>" name="city" >
                                <input class="info " type="hidden" value="<%= rs.getString("State") %>" name="state">
                                <input class="info " type="hidden" value="<%= rs.getString("Address") %>" name="address" >
                                <input class="info " type="hidden" value="<%= rs.getString("Pin_code") %>" name="pin" >
                                
                                <input class="update btn btn-success" type="submit"  value="Update">
                                <!--</form>-->
                            </div>

                        </div>
                    </div>
                </form>      

                <%
                    }  
                        rs.close();
                        pst.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>

        </div>

    </body>
</html>
