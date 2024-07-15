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

/**
 *
 * @author hp
 */
public class Add_cart_buynow extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 String imgName = request.getParameter("imgname");
        String patName = request.getParameter("patname");
        String artist = request.getParameter("btnArtist");
        String prices = request.getParameter("btnprices");
        String username = request.getParameter("username");

      
        request.setAttribute("imgname", imgName);
        request.setAttribute("patname", patName);
        request.setAttribute("btnArtist", artist);
        request.setAttribute("btnprices", prices);
        request.setAttribute("username", username);

    RequestDispatcher rd = request.getRequestDispatcher("Payment_Page.jsp");
    rd.forward(request, response);   
    }

    
}
