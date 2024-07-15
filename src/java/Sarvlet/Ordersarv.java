package Sarvlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Ordersarv extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int count = 0;
        String Painting = request.getParameter("imgpath");
        String Painting_name = request.getParameter("Painting_name");
        String Payment_method = request.getParameter("pay");
        String Total_prices = request.getParameter("prices");
        String Username = request.getParameter("user1");
        String Address = request.getParameter("add");
        String Artist = request.getParameter("artist");
        String Full_Name = request.getParameter("username");
//        out.println(Painting+"<br>"+Painting_name+"<br>"+Payment_method+"<br>"+Total_prices+"<br>"+Username+"<br>"+Address+"<br>"+Artist+"<br>"+Full_Name);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String Sql = "INSERT INTO web.order(Painting, Painting_name, Payment_method, Total_prices, Username, Address, Artist, Full_Name) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(Sql);
            pst.setString(1, Painting);
            pst.setString(2, Painting_name);
            pst.setString(3, Payment_method);
            pst.setString(4, Total_prices);
            pst.setString(5, Username);
            pst.setString(6, Address);
            pst.setString(7, Artist);
            pst.setString(8, Full_Name);

            count = pst.executeUpdate();
            if (count == 1) {
            out.println("<div class='alert alert-success d-flex align-items-center ' role='alert'><svg class='bi flex-shrink-0 me-2' width='24' height='24' role='img' aria-label='Danger:'><use xlink:href='#exclamation-triangle-fill'/></svg><div>Order Confirm</div></div>");
//                response.sendRedirect("OrderConfirm.html");
            RequestDispatcher rd = request.getRequestDispatcher("OrderConfirm.html");
            rd.forward(request, response);
        } else {
            out.println("<div class='alert alert-danger d-flex align-items-center ' role='alert'><svg class='bi flex-shrink-0 me-2' width='24' height='24' role='img' aria-label='Danger:'><use xlink:href='#exclamation-triangle-fill'/></svg><div>Something went wrong !</div></div>");
            RequestDispatcher rd = request.getRequestDispatcher("Payment_Page.jsp");
            rd.forward(request, response);
        }
        } catch (Exception e) {
            response.sendRedirect("Login_page.html");

        }
        
    }

}
