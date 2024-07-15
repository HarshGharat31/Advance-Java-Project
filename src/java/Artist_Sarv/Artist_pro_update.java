/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Artist_Sarv;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Artist_pro_update extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String fullName = request.getParameter("fname");
        String shopName = request.getParameter("shop");
        String mobileNumber = request.getParameter("mob");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pin");
        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String sql = "UPDATE artist SET Full_Name=?, Shop_Name=?, Mobile_Number=?, City=?, State=?, Address=?, Pincode=?, Email_ID=? WHERE Username=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, fullName);
            pst.setString(2, shopName);
            pst.setString(3, mobileNumber);
            pst.setString(4, city);
            pst.setString(5, state);
            pst.setString(6, address);
            pst.setString(7, pincode);
            pst.setString(8, email);
            pst.setString(9, (String) request.getSession().getAttribute("username"));

            pst.executeUpdate();

            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
                    out.print("<div class='alert alert-success' role='alert'>Order Cancelled</div>");

//        response.sendRedirect("ArtProfile_Page.jsp");
         RequestDispatcher rd=request.getRequestDispatcher("ArtProfile_Page.jsp");
            rd.include(request, response);

    }
}
