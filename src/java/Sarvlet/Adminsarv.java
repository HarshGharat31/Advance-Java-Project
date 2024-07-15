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
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class Adminsarv extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();

        
        String u, p;
        u = request.getParameter("username");
        p = request.getParameter("pass");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String sql = "Select * from admin where Admin=? and Password=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, u);
            pst.setString(2, p);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("username", u);
                response.sendRedirect("JSP/Admin_Dashbored.jsp");  
                out.println("<script type='text/javascript'>");
                out.println("alert('Welcome Admin');");
                out.println("</script>");
            }
            else{
                out.println("<div class='alert alert-danger d-flex align-items-center ' role='alert'><svg class='bi flex-shrink-0 me-2' width='24' height='24' role='img' aria-label='Danger:'><use xlink:href='#exclamation-triangle-fill'/></svg><div>Username & Password incorrect</div></div>");

                RequestDispatcher rd=request.getRequestDispatcher("Admin_Login.jsp");
                rd.include(request, response);
//                response.sendRedirect("Admin_Login.jsp");
               
            }
        con.close();
        } catch (Exception e) {
            
        }
        
    

    }    
}
