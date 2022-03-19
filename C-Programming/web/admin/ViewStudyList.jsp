<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.sqlite.SQLiteDataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>
            Study List
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: Helvetica Neue, Arial;
                font-size: 18px;
                background-color: #6e87a7;
            }

            h1 {
                font-size: 40px;
                margin-bottom: 20px;
                font-weight: bold;
                color: black;
            }

            .container {
                width: 1140px;
                margin: 20px auto 0 auto;

            }
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            td {
                width: auto;
            }

            tr:nth-child(odd) {
                background-color: #dddddd;
            }
            tr:nth-child(even) {
                background-color: white;

            }


        </style>

    </head>
    <body>
        <div class="container">
            <%
                String login = request.getParameter("login");
            %>
            <h1>STUDY LIST</h1>

            <table>
                 <tr style="color:blue;">
                    <th>Student Account:</th>
                     <th><%=login%></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th>CHAPTER</th>
                    <th>PROGRAM NAME</th>
                    <th>DEBUG</th>
                    <th>RUN</th>
                </tr>
                <%                        //  ServletContext application1 = getServletContext();
                    SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");
                    int count = 0;
                    String ID = request.getParameter("idvalue");
                    int userID = Integer.parseInt(ID);
                    //  int user_id = (int) session.getAttribute("user_id");
                    if (dataSource != null) {
                        Connection dbConn = null;
                        try {
                            dbConn = dataSource.getConnection();
                            //String queryallString = "SELECT run,debug, program_id FROM `record` WHERE user_id=? order by program_id;";
                            // String queryString = "select photos.file_name,photos.photo_id, credential.user_id,photos.share,credential.login from photos join keyword ON photos.photo_id = keyword.photo_id join credential ON photos.user_id = credential.user_id where keyword.key_name LIKE ?";
                            String queryallString = "SELECT r.run,r.debug, r.program_id,p.program_name FROM `record` AS r JOIN `program` AS p ON p.program_id = r.program_id WHERE r.user_id=? order by p.program_id;";
                            PreparedStatement allstatement = dbConn.prepareStatement(queryallString);
                            allstatement.setInt(1, userID);
                            try (ResultSet allresults = allstatement.executeQuery();) {
                                while (allresults.next()) {
                                    int run = allresults.getInt("run");
                                    int debug = allresults.getInt("debug");
                                    int proID = allresults.getInt("program_id");
                                    String program_name = allresults.getString("program_name");


                %> 
                <tr>
                    <td>CHAPTER-<%=proID%></td>
                    <td><%=program_name%></td>
                    <td><%=debug%></td>
                    <td><%=run%></td>
                </tr>
                <%  count++;
                                }
                            }

                        } catch (SQLException ex) {

                        }
                    }


                %>
            </table>

        </div>


    </body>
</html>

