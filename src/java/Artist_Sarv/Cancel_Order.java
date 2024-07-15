/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Artist_Sarv;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
@WebServlet(name = "Cancel_Order", urlPatterns = {"/Cancel_Order"})
public class Cancel_Order extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     PrintWriter out=response.getWriter();
        String ord_id=request.getParameter("o_id");
        String user=request.getParameter("user56");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            PreparedStatement pst = con.prepareStatement("DELETE FROM web.order WHERE  Order_ID= ? and Username=?");
            pst.setString(1, ord_id);
            pst.setString(2, user);
            pst.executeUpdate();
            con.close();

           } catch (Exception e) {
//               e.printStackTrace(out);
           }
//            response.sendRedirect("");
            out.print("<div class='alert alert-success' role='alert'>Order Cancelled</div>");
            RequestDispatcher rd=request.getRequestDispatcher("Order_User_page.jsp");
            rd.include(request, response);

    }

}
