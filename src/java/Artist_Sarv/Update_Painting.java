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
import java.sql.*;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Update_Painting extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paintingID = request.getParameter("pan_id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String prices = request.getParameter("prices");
        String category = request.getParameter("category");

        Connection con;
        PreparedStatement pst;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String sql = "UPDATE painting SET Name=?, Description=?, Prices=?, Category=? WHERE P_ID=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2,description);
            pst.setString(3, prices);
            pst.setString(4, category);
            pst.setString(5, paintingID);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("Manage_Painting.jsp");
        

    }

}
