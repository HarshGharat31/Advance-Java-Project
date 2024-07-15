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

public class ForwardUpdateFormServlet extends HttpServlet {

      @Override
      public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paintingID = request.getParameter("pan_id");
        String name = request.getParameter("name");
        String description = request.getParameter("Descri");
        String category = request.getParameter("cate");
        String prices = request.getParameter("prices");
        
        request.setAttribute("pan_id", paintingID);
        request.setAttribute("name", name);
        request.setAttribute("description", description);
        request.setAttribute("category", category);
        request.setAttribute("prices", prices);
        
        RequestDispatcher rd = request.getRequestDispatcher("UpdateForm.jsp");
        rd.forward(request, response);
//        response.sendRedirect("UpdateForm.jsp");
    }

}
