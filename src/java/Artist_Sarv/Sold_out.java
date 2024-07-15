/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Artist_Sarv;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author hp
 */
public class Sold_out extends HttpServlet {

       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String ord_id=request.getParameter("ord_id");
        String art=request.getParameter("artist");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            PreparedStatement pst = con.prepareStatement("DELETE FROM web.order WHERE  Order_ID= ? and Artist=?");
            pst.setString(1, ord_id);
            pst.setString(2, art);
            pst.executeUpdate();
            con.close();

           } catch (Exception e) {
           }
            response.sendRedirect("Artist_Order.jsp");


    }

}
