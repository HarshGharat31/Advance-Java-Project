/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Artist_Sarv;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author hp
 */
public class Delete_Painting_sarv extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
         Connection con;
        PreparedStatement pst;

                String paintingID = request.getParameter("pan_id");
                        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String sql = "DELETE FROM painting WHERE P_ID=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, paintingID);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        response.sendRedirect("");
          out.print("<div class='alert alert-success' role='alert'>Removed !</div>");
            RequestDispatcher rd=request.getRequestDispatcher("Manage_Painting.jsp");
            rd.include(request, response);






    }

   
}
