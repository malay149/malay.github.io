/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.sqlite.SQLiteDataSource;

/**
 *
 * @author theth
 */
public class AddUserServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] nameParam = request.getParameterValues("login");
        String[] secretParam = request.getParameterValues("password");
        String[] roleParam = request.getParameterValues("role");
        
        ServletContext application = getServletContext();
         SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");
        for (int i = 0; i < nameParam.length; i++) {
            try (Connection dbConn = dataSource.getConnection()) {

                String insertString = "INSERT INTO credential (login, secret,type,status) VALUES (?,?,?,?)";
                try (PreparedStatement insertStatement = dbConn.prepareStatement(insertString)) {
                    
                    insertStatement.setString(1, nameParam[i]);
                    insertStatement.setString(2, secretParam[i]);
                    insertStatement.setString(3, roleParam[i]);
                    insertStatement.setString(4, "active");
                    //insertStatement.setString(5, "C\:\\photo");
                    insertStatement.executeUpdate();
                }

            } catch (SQLException ex) {
              //  Logger.getLogger(uploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
         response.sendRedirect("dashboard.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
