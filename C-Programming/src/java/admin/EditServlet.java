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
public class EditServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            int ID = (int) session.getAttribute("user_id");
            String login_name = request.getParameter("login");
            String password = request.getParameter("secret");
           // String folder_name = request.getParameter("folder");
            String user_type = request.getParameter("role");
            ServletContext application1 = getServletContext();
            SQLiteDataSource dataSource = (SQLiteDataSource) application1.getAttribute("dataSource");

            if (dataSource != null) {
                Connection dbConn = null;
                try {
                    dbConn = dataSource.getConnection();
                    String updateQuery = "update `credential` SET login = ?, secret=?, type=? WHERE user_id= ?;";
                     try (PreparedStatement updateStatement = dbConn.prepareStatement(updateQuery)) {
                                            updateStatement.setString(1, login_name);
                                            updateStatement.setString(2, password);
                                            updateStatement.setString(3, user_type);
                                            
                                            updateStatement.setInt(4, ID);
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

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
