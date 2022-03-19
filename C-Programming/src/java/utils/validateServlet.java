package utils;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.sqlite.SQLiteConfig;
import org.sqlite.SQLiteDataSource;
import org.sqlite.javax.SQLiteConnectionPoolDataSource;

public class validateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nameParam = request.getParameter("name");
        String secretParam = request.getParameter("secret");
        String roleParam = request.getParameter("role");

        if ((nameParam != null) && (roleParam != null) && (secretParam != null)) {
            ServletContext application = getServletContext();
            SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");

            if (dataSource != null) {
                Connection dbConn;
                try {
                    dbConn = dataSource.getConnection();
                    String queryString = "SELECT * FROM `credential` WHERE login=? and secret=? and type=? and status='active'";
                    PreparedStatement statement = dbConn.prepareStatement(queryString);
                    statement.setString(1, nameParam);
                    statement.setString(2, secretParam);
                    statement.setString(3, roleParam);

                    try (ResultSet results = statement.executeQuery();) {
                        if (results.next()) {

                            HttpSession session = request.getSession();
                            session.setAttribute("login", results.getString("login"));
                            session.setAttribute("type", results.getString("type"));
                            session.setAttribute("lds",0);
                            session.setAttribute("user_id", results.getInt("user_id"));
                            session.setAttribute("Lock", "filterLock");

                            String role = results.getString("type");
                            if ("Teacher".equals(roleParam)) {
                                
                             
                                response.sendRedirect("admin/dashboard.jsp");

                            } else {
                                response.sendRedirect("user/dashboard.jsp");
                            }

                        } else {
                            // No match in DB
                            // HttpSession session = request.getSession();
                            //  session.setAttribute("message","error");
                            // response.sendRedirect("login.jsp");
                            request.setAttribute("error", "Invalid User Name or Password !!!");
                            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                            rd.include(request, response);

                        }
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(validateServlet.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("login.jsp");
                }

            } else {
                //No data source in servlet cntext
                response.sendRedirect("login.jsp");

            }
        } else {
            //request parameters are not valid
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    @Override
    public void init() throws ServletException {
        super.init();
      //  String dataBase = getServletContext().getRealPath("/db/CProgramming.db3");
        ServletContext application = getServletContext();
        try {
            Class.forName("org.sqlite.JDBC");
            SQLiteConfig config = new SQLiteConfig();
            config.setPragma(SQLiteConfig.Pragma.FOREIGN_KEYS, "on");
            SQLiteConnectionPoolDataSource dataSource = new SQLiteConnectionPoolDataSource(config);
        //   dataSource.setUrl("jdbc:sqlite:C:\\theth\\OneDrive\\Documents\\NetBeansProjects\\C-Programming\\web\\db\\CProgramming.db3");
         //   dataSource.setUrl("jdbc:sqlite:"+dataBase);
          dataSource.setUrl("jdbc:sqlite:C:\\SampleDBs\\C-Programming.db3");
            application.setAttribute("dataSource", dataSource);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(validateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
