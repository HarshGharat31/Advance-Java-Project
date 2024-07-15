/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sarvlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Add_to_Cart_sarv extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int count = 0;
        HttpSession session = request.getSession(false);
        String user = (String) session.getAttribute("username");

        String Image = request.getParameter("p-img");
        String Name = request.getParameter("pname");
        String artist = request.getParameter("Artist");
        String amount = request.getParameter("prices");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String Sql = "INSERT INTO cart(Painting,PName,Prices,Artist,user) VALUES(?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(Sql);
            pst.setString(1, Image);
            pst.setString(2, Name);
            pst.setString(3, amount);
            pst.setString(4, artist);
            pst.setString(5, user);
            count = pst.executeUpdate();

            if (count == 1) {
//                out.print("<h2>Add successfully</h2>");
                response.sendRedirect("Painting_page.jsp");
//                RequestDispatcher rd;
//                rd = request.getRequestDispatcher("Add_Painting.jsp");

            } else {
                out.print("<h2>Something went wrong</h2>");

            }
        } catch (Exception e) {
            response.sendRedirect("Login_page.html");

        }

    }

}
