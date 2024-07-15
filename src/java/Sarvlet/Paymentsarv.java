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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author hp
 */
public class Paymentsarv extends HttpServlet {

    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    
    
    String img = request.getParameter("imgname");
    String pname = request.getParameter("patname");
    String art = request.getParameter("btnArtist");
    String amount = request.getParameter("btnprices");
    String id = request.getParameter("Id");
    String user = request.getParameter("username");
    
  
    request.setAttribute("imgname", img);
    request.setAttribute("patname", pname);
    request.setAttribute("btnArtist", art);
    request.setAttribute("btnprices", amount);
    request.setAttribute("Id", id);
    request.setAttribute("username", user);
    
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("Payment_Page.jsp");
    dispatcher.forward(request, response);
}

}
