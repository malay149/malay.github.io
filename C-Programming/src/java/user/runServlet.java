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
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class runServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            session.setAttribute("lds", 2);
            int user_id = (int) session.getAttribute("user_id");
            String program_id = request.getParameter("program_id");
            int pID = Integer.parseInt(program_id);
            int oldRun = 0;
            int recID=0;
            ServletContext application1 = getServletContext();
            SQLiteDataSource dataSource = (SQLiteDataSource) application1.getAttribute("dataSource");

            if (dataSource != null) {
                Connection dbConn = null;
                try {
                    dbConn = dataSource.getConnection();
                    String queryString = "SELECT run,record_id FROM `record` WHERE user_id=? and program_id=?;";
                    PreparedStatement statement = dbConn.prepareStatement(queryString);

                    statement.setInt(1, user_id);
                    statement.setInt(2, pID);

                    try (ResultSet results = statement.executeQuery();) {
                        while (results.next()) {
                            oldRun = results.getInt("run");
                            recID = results.getInt("record_id");
                           
                        }
                    }
                    if (recID > 0) {
                       
                        oldRun = oldRun + 1;
                        String updateQuery = "update `record` SET run =? WHERE user_id=? and program_id=?;";
                        try (PreparedStatement updateStatement = dbConn.prepareStatement(updateQuery)) {
                            updateStatement.setInt(1, oldRun);
                            updateStatement.setInt(2, user_id);
                            updateStatement.setInt(3, pID);
                            updateStatement.executeUpdate();

                            updateStatement.close();
                        }
                    } else {
                        String insertString = "INSERT INTO record (program_id,user_id,debug,run) VALUES (?,?,?,?);";
                        try (PreparedStatement insertStatement = dbConn.prepareStatement(insertString)) {

                            insertStatement.setInt(1, pID);
                            insertStatement.setInt(2, user_id);
                            insertStatement.setInt(3,0);
                            insertStatement.setInt(4,1);
                            //insertStatement.setString(5, "C\:\\photo");
                            insertStatement.executeUpdate();
                        }
                    }

                    dbConn.close();
                     switch (pID) {
                        case 1:
                             response.sendRedirect("if-else.jsp");
                            break;
                        case 2:
                             response.sendRedirect("looping.jsp");
                            break;
                        case 3:
                             response.sendRedirect("function.jsp");
                            break;
                        case 4:
                             response.sendRedirect("array.jsp");
                            break;
                        case 5:
                             response.sendRedirect("pointer.jsp");
                            break;
                        
                    }

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
