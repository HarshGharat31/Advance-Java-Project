
package Sarvlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Update_Profile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int count = 0;
        String Full_name = request.getParameter("fname");
        String Mobile_Number = request.getParameter("con_no");
        String mail = request.getParameter("email_id");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String address = request.getParameter("address");
        String pin = request.getParameter("pin");
        String username = request.getParameter("user12");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String sql = "UPDATE user SET Full_Name=?, Mobile_no=?, City=?, State=?, Address=?, Pin_code=?, Email_ID=? WHERE username=?";
            PreparedStatement pst = con.prepareStatement(sql);

           
            pst.setString(1, Full_name);
            pst.setString(2, Mobile_Number);
            pst.setString(3, city);
            pst.setString(4, state);
            pst.setString(5, address);
            pst.setString(6, pin);
            pst.setString(7, mail);
            pst.setString(8, username);

           
            count = pst.executeUpdate();

                 

           
            con.close();
              if (count == 1) {
               out.print("<div class='alert alert-danger' role='alert'>Username and Password Incorrect</div>");
               RequestDispatcher rd=request.getRequestDispatcher("User_Profile.jsp");
               rd.forward(request, response);
        } else {
                RequestDispatcher rd=request.getRequestDispatcher("User_Profile.jsp");
               rd.forward(request, response);
                              out.print("<div class='alert alert-danger' role='alert'>Username and Password Incorrect</div>");

           }

        } catch (Exception e) {
            
            e.printStackTrace();
           
        }

         //        if (count == 1) {
//            
//            out.println("<h2>Update Successful</h2>");
//        } else {
//           
//            out.println("<h2>Update Failed</h2>");
//        }
    }
}
