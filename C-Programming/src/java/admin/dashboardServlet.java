package admin;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.sqlite.SQLiteDataSource;
import utils.user;

public class dashboardServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ServletContext application = getServletContext();
            SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");
            if (dataSource != null) {
                Connection dbConn = null;
                try {
                    dbConn = dataSource.getConnection();
                    String queryallString = "SELECT * FROM `credential`";
                    PreparedStatement allstatement = dbConn.prepareStatement(queryallString);

                    try (ResultSet allresults = allstatement.executeQuery();) {

                        //  HttpSession allsession = request.getSession();
                        //  allsession.setAttribute("user_sets", allresults);
                        // ResultSet user_sets = (ResultSet) session.getAttribute("user_sets");
                        ArrayList<user> std = new ArrayList<user>();
                        while (allresults.next()) {
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<title>Servlet dashboardServlet</title>");
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<h1>Servlet dashboardServlet at " + request.getContextPath() + "</h1>");
                            out.println("<tr>");
                            out.println("<td>" + allresults.getString("login") + "</td>");
                            out.println("<td>" + allresults.getString("type") + "</td>");
                            out.println("<td>" + allresults.getString("status") + " kr.</td>");
                            out.println("<td>" + allresults.getString("user_id") + "</td>");
                            out.println("</tr>");
                            out.println("</body>");
                            out.println("</html>");
                        }
                    }

                } catch (SQLException ex) {

                }
            }

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

    }
}
