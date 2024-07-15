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
//not used
public class Multi_sarv extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    // Error handling for parsing integers
    try {
        int p = Integer.parseInt(request.getParameter("prices"));
        int q = Integer.parseInt(request.getParameter("Quantity"));
        int total= 0;
        total=  p * q;
            
        // Set the calculated total as a request attribute
        request.setAttribute("sum", total);
    

        // Forward the request to a JSP page to display the result
        RequestDispatcher dispatcher = request.getRequestDispatcher("Add_to_Cart.jsp");
        dispatcher.forward(request, response);
    } catch (NumberFormatException e) {
        // Handle the case where parameters cannot be parsed as integers
        out.println("Invalid input. Please enter valid numbers for price and quantity."); 
    
                
 
    }

    }
}
