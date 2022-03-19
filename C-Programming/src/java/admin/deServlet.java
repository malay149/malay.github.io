/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

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
import javax.servlet.http.HttpSession;
import org.sqlite.SQLiteDataSource;

/**
 *
 * @author theth
 */
public class deServlet extends HttpServlet {

    
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String ID = request.getParameter("idvalue");
            String status = request.getParameter("status");
            if("active".equals(status))
               status="disabled";
            else
            status="active";
           // HttpSession session = request.getSession();
          // String status = (String) session.getAttribute("status");
           
            ServletContext application1 = getServletContext();
            SQLiteDataSource dataSource = (SQLiteDataSource) application1.getAttribute("dataSource");

            if (dataSource != null) {
                Connection dbConn = null;
                try {
                    dbConn = dataSource.getConnection();
                    String updateQuery = "update `credential` SET status = ? WHERE user_id= ?";
                     try (PreparedStatement updateStatement = dbConn.prepareStatement(updateQuery)) {
                                            updateStatement.setString(1, status);
                                            updateStatement.setString(2, ID);
                                            updateStatement.executeUpdate();
                                            
                                            updateStatement.close();
                                        }

                                        dbConn.close();
                                        response.sendRedirect("dashboard.jsp");

                } catch (SQLException ex) {

                }
            }
            
            
            
        }
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
          try {
              processRequest(request, response);
          } catch (SQLException ex) {
              Logger.getLogger(deServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
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
          try {
              processRequest(request, response);
          } catch (SQLException ex) {
              Logger.getLogger(deServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
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
