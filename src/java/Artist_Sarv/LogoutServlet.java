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
import jakarta.servlet.http.HttpSession;
public class LogoutServlet extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
            out.print("<div class='alert alert-success' role='alert'>You have successfully logged out!</div>");
//             response.sendRedirect();
             RequestDispatcher rd = request.getRequestDispatcher("index.html");
             rd.forward(request, response);

        }
         
//        response.sendRedirect("index.html");
    }
}


