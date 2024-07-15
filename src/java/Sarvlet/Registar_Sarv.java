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
public class Registar_Sarv extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int count = 0;
        String Full_Name = request.getParameter("fname");
        String Mobile_no = request.getParameter("mobno");
        String Address = request.getParameter("address");
        String City = request.getParameter("city");
        String State = request.getParameter("state");
        String Pin_code = request.getParameter("pincode");
        String username = request.getParameter("username");
        String Email_ID = request.getParameter("uemail");
        String Password = request.getParameter("pass");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false","root","root");
            String Sql = "Insert into user(Full_Name,Mobile_no,Address,City,"+
                     "State,Pin_code,username,Email_ID,Password) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(Sql);
            pst.setString(1, Full_Name);
            pst.setString(2, Mobile_no);
            pst.setString(3, Address);
            pst.setString(4, City);
            pst.setString(5, State);
            pst.setString(6, Pin_code);
            pst.setString(7, username);
            pst.setString(8, Email_ID);
            pst.setString(9, Password);
            count = pst.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }   
        if(count==1){
            out.print("<div class='alert alert-success' role='alert'>Register Sucessfully</div>");
            RequestDispatcher rd=request.getRequestDispatcher("/Login_page.html");
            rd.include(request, response);

        }
        else{
                out.print("<div class='alert alert-danger' role='alert'>Something went wrong</div>");
            RequestDispatcher rd=request.getRequestDispatcher("/Registar.html");
            rd.include(request, response);

        }

    }

   
}
