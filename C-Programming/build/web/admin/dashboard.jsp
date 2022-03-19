<%-- 
    Document   :ADMIN dashboard
    Created on : Jun 2, 2021, 9:03:46 PM
    Author     : theth
--%>



<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.sqlite.SQLiteDataSource"%>
<%@page import="utils.user"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<head>
    <title>Output page: Fetching the value from session</title>
</head>
<body> 
    

    <%
        //  ServletContext application1 = getServletContext();
        SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");

        if (dataSource != null) {
            Connection dbConn = null;
            try {
                dbConn = dataSource.getConnection();
                String queryallString = "SELECT * FROM `credential` order by type desc;";
                PreparedStatement allstatement = dbConn.prepareStatement(queryallString);

                try (ResultSet allresults = allstatement.executeQuery();) {

                    HttpSession asession = request.getSession();
                    // ResultSet user_sets = (ResultSet) session.getAttribute("user_sets");
                    ArrayList<user> user_list = new ArrayList<user>();

                    while (allresults.next()) {

                        asession.setAttribute("user_name", allresults.getString("login"));
                        
                        String login = allresults.getString("login");
                        String type = allresults.getString("type");
                        String status = allresults.getString("status");
                        String user_id = allresults.getString("user_id");
                        //      loginlist[0] = allresults.getString("login");
                        // create object with db data;
                        user yourObject = new user(user_id, login, type, status);
                        // add object to collection
                        user_list.add(yourObject);

                    }

                    asession.setAttribute("Users", user_list);

                }

            } catch (SQLException ex) {

            }
        }


    %> 
</body> 
</html>



<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            var i = 1;
            function addRow() {
                if (i < 10) {
                    const div = document.createElement('div');

                    div.className = 'row';

                    div.innerHTML = `
    
                            <div class="col-md-4">
                                <input type="text" name="login" class="form-control" required>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="password" class="form-control" required>
                            </div>
                            <div class="col-md-3">
                                <select name="role" class="form-control" required>
                                    <option value="Student" selected="">Student</option>
                                    <option value="Teacher" >Teacher</option>
                                </select>
                            </div>
                            
                            <button onclick="removeRow(this)" class="red_button">-</button>
  `;

                    document.getElementById('content').appendChild(div);
                    i++;
                }
            }
            function removeRow(input) {
                document.getElementById('content').removeChild(input.parentNode);
                i--;

            }
        </script>
        <style>
            #myHeader {
                background-color: #102b5a;
                color: white;
                padding: 20px;
                text-align: center;
            }
            .button {
                background-color: white; 
                border-color:black;
                color:green;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 23px;
                font-weight:bold;
                color:green;
                cursor: pointer;
                border-radius: 40px ;
                height: 40px ;
                width: 40px;
                margin: 5px;
            }
            .red_button {
                margin: 5px;
                background-color: red; 
                border-color:black;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 25px;
                font-weight:bold;
                color:green;
                cursor: pointer;
                border-radius: 40px ;
                height: 40px ;
                width: 40px;
            }
             body {
                font-family: Helvetica Neue, Arial;
                font-size: 18px;
                background-color: #6e87a7;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row" style="background:#102b5a;">
            <div class="h5 text-center col-md-11">
                <h1 id="myHeader">Manage Users Page </h1> 
            </div>
                <div class="col-md-1"style=" margin-top: 15px; color: white;">

                        <a class="btn btn-outline-primary" target="target" href="logoutAdminServlet">Logout</a>
                    </div>
            </div>
            <div class="row p-1"></div>
            <div class="row p-1"></div>
            <div class="row">
                <label class="col-md-4">Username</label>
                <label class="col-md-2">Role</label>
            </div>

            <div class="row p-1"></div>
            <div class="row p-1"></div>
            <%ArrayList<user> user_lists = new ArrayList<user>();
                user_lists = (ArrayList<user>) session.getAttribute("Users");
                //out.print("Toatl user "+user_list.size());
                String login = "";
                String type = "";
                String status = "";
                String user_id = "";
                int i = 0;
                for (user acc : user_lists) {

                    login = acc.login;
                    type = acc.type;
                    status = acc.status;
                    user_id = acc.user_id;
                    // out.print(" user "+ login);

            %>
            <form action="deleteServlet" method="post">
                <div class="row">

                    <div class="col-md-4">
                        <input type="text" name="login" id="username" class="form-control" value= "<%= login%>" readonly>
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="role" id="role" class="form-control" value= "<%= type%>" readonly>
                    </div>
                    <div class="col-md-1" >
                        <a class="btn btn-primary btn-block" style="background:green;" target="target" href="ViewStudyList.jsp?idvalue=<%=user_id%>&login=<%=login%>">View</a>
                    </div>
                    <div class="col-md-1">
                        <a class="btn btn-primary btn-block" target="target" href="EditUser.jsp?idvalue=<%=user_id%>">Edit</a>
                    </div>
                    <div class="col-md-1">

                        <input type="submit" value="Delete" class="btn btn-danger btn-block" >

                    </div>

                    <div class="col-md-2">
                        <form action="deServlet" method="post">

                            <a class="btn btn-secondary btn-block" target="target" href="deServlet?idvalue=<%=user_id%>&status=<%=status%>"  id="disable">Disable/Enable</a>


                        </form>
                    </div>
                </div>
            </form>
            <%
                    i++;
                }
            %>


            <div class="row p-1"></div>
            <hr>
            <div class="row p-1"></div>
            <div class="row p-1"></div>

        </div>
        <div class="container-fluid">
            <form action="AddUserServlet" method="post" >
                <div class="row">
                    <label class="col-md-4">Username</label>
                    <label class="col-md-4">Password</label>
                    <label class="col-md-2">Role</label>
                </div>
                <div class="row">


                    <div class="col-md-12" style="height:auto; background-color:none" >
                        <div class="row" >

                            <div class="col-md-4">
                                <input type="text" name="login" class="form-control" required>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="password" class="form-control" required>
                            </div>
                            <div class="col-md-3">
                                <select name="role" class="form-control" required>
                                    <option value="Student" selected="">Student</option>
                                    <option value="Teacher" >Teacher</option>
                                </select>
                            </div>
                            <button onclick="addRow()" class=" button" style="background-color:greenyellow;">+</button>
                        </div>

                        <div id="content">

                        </div>
                    </div>
                </div>
                <hr>
                <div>
                    <input type="submit" class="btn btn-primary btn-block" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>

