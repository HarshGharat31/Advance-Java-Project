
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="Css/navcss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nav</title>
        <style>
            .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
            }

            .navbar{
                background-image: linear-gradient(45deg, rgba(254, 246, 210, 0.53) 0%, rgba(254, 246, 210, 0.53) 14.286%,rgba(221, 240, 216, 0.53) 14.286%, rgba(221, 240, 216, 0.53) 28.572%,rgba(188, 233, 223, 0.53) 28.572%, rgba(188, 233, 223, 0.53) 42.858%,rgba(156, 227, 229, 0.53) 42.858%, rgba(156, 227, 229, 0.53) 57.144%,rgba(123, 220, 235, 0.53) 57.144%, rgba(123, 220, 235, 0.53) 71.42999999999999%,rgba(90, 214, 242, 0.53) 71.43%, rgba(90, 214, 242, 0.53) 85.71600000000001%,rgba(57, 207, 248, 0.53) 85.716%, rgba(57, 207, 248, 0.53) 100.002%),linear-gradient(135deg, rgb(246, 99, 200) 0%, rgb(246, 99, 200) 12.5%,rgb(223, 98, 196) 12.5%, rgb(223, 98, 196) 25%,rgb(199, 97, 192) 25%, rgb(199, 97, 192) 37.5%,rgb(176, 96, 188) 37.5%, rgb(176, 96, 188) 50%,rgb(152, 95, 184) 50%, rgb(152, 95, 184) 62.5%,rgb(129, 94, 180) 62.5%, rgb(129, 94, 180) 75%,rgb(105, 93, 176) 75%, rgb(105, 93, 176) 87.5%,rgb(82, 92, 172) 87.5%, rgb(82, 92, 172) 100%);
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
                            <a class="nav-link active" aria-current="page" href="Welcomeuser.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Painting_page.jsp">Paintings</a>
                        </li>
                        <%
                   int cartno=0;
                   session.getAttribute("username") ;
                 String cart = (String) session.getAttribute("username");

              try {
                   
                              
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
               String sql = "SELECT COUNT(Painting) cart_count FROM cart where user=?";
               PreparedStatement pst = con.prepareStatement(sql);
               pst.setString(1,cart);
                     
 
       ResultSet rs = pst.executeQuery();
       if(rs.next()){
              cartno = rs.getInt("cart_count");

                        %>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="Add_to_Cart.jsp" aria-current="page">My Cart(<%=cartno%>)</a>
                        </li>
                        <% }
           else{
                   
                  }
         
      } catch (Exception e) {
          e.printStackTrace();
      }%>
                        <li class="nav-item">
                            <a class="nav-link " href="Order_User_page.jsp" aria-current="page">My Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="User_Profile.jsp" aria-current="page">Profile</a>
                        </li>

                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-3" type="search" id="searchInput" placeholder="Search" aria-label="Search" onkeyup="searchPaintings()">

                    </form>
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
