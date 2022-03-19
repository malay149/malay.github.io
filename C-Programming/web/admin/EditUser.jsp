<%-- 
    Document   : login
    Created on : Jun 2, 2021, 8:46:27 PM
    Author     : theth
--%>


<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.sqlite.SQLiteDataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit User Information</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

    </head>
    <%
        String ID = request.getParameter("idvalue");
        //out.print(" userID "+ ID);
               if (ID != null) {
           // ServletContext application = getServletContext();
            SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");

            if (dataSource != null) {
                Connection dbConn;
                try {
                    dbConn = dataSource.getConnection();
                    String queryString = "SELECT * FROM `credential` WHERE user_id=?";
                    PreparedStatement statement = dbConn.prepareStatement(queryString);
                    statement.setString(1, ID);
                    try (ResultSet results = statement.executeQuery();) {
                        if (results.next()) {

                          //  HttpSession session = request.getSession();
                          //  session.setAttribute("login", results.getString("login"));
                          // session.setAttribute("user_type", results.getString("type"));
                           // session.setAttribute("homeFolder", results.getString("home_folder"));
                           session.setAttribute("user_id", results.getInt("user_id"));

                            String login = results.getString("login");
                            String secret = results.getString("secret");
                           // String home_folder = results.getString("home_folder");
                            String role = results.getString("type");
                           
                            
    %>
   
    <body>
        <nav class="navbar bg-info navbar-dark justify-content-center fixed-top">
            <h2>Photo Repository</h2>
        </nav>
        <div class="container-fluid">
            <form action="EditServlet" method="post" >
                <div class="col-md-12" style="height:100px"></div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <label class="col-md-7"style="float:right;" > <%
                        String login_msg = (String) request.getAttribute("error");
                        if (login_msg != null)
                            out.println("<font color=red size=4px>" + login_msg + "</font>");
                        %></label>
                </div>
                <div class="row">
                    <div class="col-md-2" > </div>

                    <label class="col-md-2" >User Name:</label>
                    <div class="col-md-5"><input type="text" name="login" class="form-control" value= "<%=login%>" required></div>
                </div>

                <div class="col-md-12" style="height:20px"></div>
                <div class="row">
                    <div class="col-md-2" ></div>
                    <label class="col-md-2">Password:</label> 
                    <div class="col-md-5"><input type="text" name="secret" class="form-control" value= "<%=secret%>" required></div>
                </div>
                <div class="col-md-12" style="height:20px"></div>
                
                <div class="col-md-12" style="height:20px"></div>
                <div class="row">
                    <div class="col-md-2" ></div>
                    <label class="col-md-2">Role:</label> 
                    <div class="col-md-5"><input type="text" name="role" class="form-control" value= "<%=role%>"placeholder="Teacher or Student" ></div>
                </div>
                <div class="col-md-12" style="height:20px"></div>
                

                
                <div class="col-md-12" style="height:40px"></div>
                <div class="row" > 
                    

                    <input type="submit" class="btn btn-primary btn-block col-md-10" value="Update" style="margin-left: 100px;">
                    
                     <a class="btn btn-danger btn-block col-md-10" target="target" href="dashboard.jsp" style="margin-top:20px;margin-left: 100px;">Cancel</a>
                </div>
               
            </form>
                 <%
                   } 
                    }

                } catch (SQLException ex) {
                 
                    response.sendRedirect("dashboard.jsp");
                }

            }  
                }
            %>

        </div>
    </body>
   
</html>
