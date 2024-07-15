<%-- 
    Document   : Admin_Dashboard
    Created on : 27-Feb-2024, 11:09:04 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="style.css">
   
    </head>
    <body>
         <div class="wrapper">

            <div class="login-box">
                <form action="Adminsarv" method="post" >
                    <h2>Admin</h2>
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail"></ion-icon>
                        </span>
                        <input type="text" name="username" required="Enter your Username !">
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="lock-closed"></ion-icon>
                        </span>
                        <input type="password"  name="pass" required="Enter Your Password!">
                        <label>Password</label>
                    </div>

                    <div class="remember-forgot">
                        <!--<label><input type="checkbox"> Remember me</label>-->
<!--                        <a href="#">Forgot Password?</a>-->
                    </div>

                    <input class="button" type="submit" value="Login">

                 </form>
            </div>

        </div>
    </body>
</html>
