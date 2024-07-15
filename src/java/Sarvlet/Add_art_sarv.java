/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sarvlet;

import jakarta.servlet.RequestDispatcher;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class Add_art_sarv extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Part file = request.getPart("artimage");
        String imageFileName = file.getSubmittedFileName();//get selected image file name
        System.out.println(imageFileName);

        String uploadPath = "D:/Online_painting_store_projet/web/images/" + imageFileName;//upload path where we have to upload our  actual image
        System.out.println(uploadPath);
        //uploading our selected imagebinto floder
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        //getting database
     
        try {
//           int c=(Integer)
            int count=0;
            HttpSession session = request.getSession(false);
            String user = (String) session.getAttribute("username");
            String Name = request.getParameter("Pname");
            String Description = request.getParameter("Description");
            String Prices = request.getParameter("price");
            String Category = request.getParameter("Category");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web?useSSL=false", "root", "root");
            String Sql = "INSERT INTO painting(Name,Description,Prices,Category,Painting,Artist) VALUES(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(Sql);
            pst.setString(1, Name);
            pst.setString(2, Description);
            pst.setString(3, Prices);
            pst.setString(4, Category);
            pst.setString(5, imageFileName);
            pst.setString(6, user);
           count= pst.executeUpdate();
           if(count==1){
            out.print("<div class='alert alert-success' role='alert'>Added Sucessfully</div>");
//             response.sendRedirect();
             RequestDispatcher rd = request.getRequestDispatcher("Add_Painting.jsp");
             rd.forward(request, response);

            }
            else{
               out.print("<h2>Something went wrong</h2>");
               

            }
        } catch (Exception e) {
        }
       
//        HttpSession session=request.getSession();
//        session.setAttribute("imgname", imageFileName);
//        RequestDispatcher rd;
//        request.setAttribute("imgname", imageFileName);
//        rd=request.getRequestDispatcher("Manage_Painting.jsp");
//        rd.forward(request, response);
   
    }
}
