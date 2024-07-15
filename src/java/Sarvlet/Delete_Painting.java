/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sarvlet;

import jakarta.servlet.RequestDispatcher;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Delete_Painting extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String P_id =request.getParameter("pid");
        String user=request.getParameter("user12");
        try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            PreparedStatement pst = con.prepareStatement("DELETE FROM cart WHERE idcart = ? and user=?");
            pst.setString(1, P_id);
            pst.setString(2, user);
            pst.executeUpdate();
            con.close();

                    
        } catch (Exception e) {
        }
         out.print("<div class='alert alert-success' role='alert'>Deleted Sucessfully</div>");
//             response.sendRedirect();
             RequestDispatcher rd = request.getRequestDispatcher("Add_to_Cart.jsp");
             rd.forward(request, response);

//        response.sendRedirect("");


    }

   
}
