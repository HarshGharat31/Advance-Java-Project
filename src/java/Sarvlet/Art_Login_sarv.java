/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sarvlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Art_Login_sarv extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String u, p;
        u = request.getParameter("username");
        p = request.getParameter("pass");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String sql = "Select * from artist where Username=? and Password=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, u);
            pst.setString(2, p);
            ResultSet rs = pst.executeQuery();

              if (rs.next()) {
//                out.print("<h1>Login Sucessfully</h1>");
                HttpSession session = request.getSession();
                session.setAttribute("username", u);
                response.sendRedirect("Art_dashboard.jsp");
                
            } else {
                out.print("<div class='alert alert-danger' role='alert'>Username and Password Incorrect</div>");
                RequestDispatcher rd=request.getRequestDispatcher("Login_Artist.html");
                rd.include(request, response);
//                response.sendRedirect("Login_page.html");


            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
