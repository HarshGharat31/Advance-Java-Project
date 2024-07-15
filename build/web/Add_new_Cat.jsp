
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href=Css/navcss.css>
        <style>
             .newuser{
                font-weight: bolder;
                font-size: x-large;
                text-align: center;
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
        <div class="container-fluid  "style="display: flex">
            <form class="section p-4 shadow p-3 mt-5  rounded col-8" style="margin:auto;" >
                <% 
            int count=0;
            String cate=request.getParameter("catname");
            try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false","root","root");
            String Sql = "Insert into category(Category) Values(?)";
            PreparedStatement pst = con.prepareStatement(Sql);
            pst.setString(1,cate);
                %>

                <div class="mb-3 ">
                    <h2 class="text-center" style="font-weight: bold;color: white;">Add Category</h2><hr>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"style="color:white;">Category Name</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" name="catname" required>
                </div>

                <div class="mb-3 text-center">
                    <input class="add btn btn-primary" id="myFunction" type="submit" value="Add" style="width: 350px">
                </div>
                <% 
                count = pst.executeUpdate();
                      con.close();
                  } catch (Exception ex) {
                      System.out.println(ex.getMessage());
                  }   
                  if(count==1){%>
                <script >
                    function myFunction() {
                        alert('Add successfully');
                    }
                </script>

                <% }
        else{%>
                <script >
                    function myFunction(){
                    alert('Something went Wrong');
                }
                </script>

                <% }%>



            </form>




        </div>
        </div>
    </body>
</html>
