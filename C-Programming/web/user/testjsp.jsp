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
            User Dashboard
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;

            }
            .notification {
                background-color: #555;
                color: white;
                text-decoration: none;
                padding: 5px 6px;
                position: relative;
                display: inline-block;
                border-radius: 1px;
                font-size:50px;
                margin-top: 20px;
            }

            .notification:hover {
                background: red;
            }

            .notification .badge {
                font-size: 15px;
                position: absolute;
                top: -10px;
                right: -10px;
                padding: 5px 10px;
                border-radius: 50%;
                background-color: red;
                color: white;
            }
            #myHeader {
                background-color: none;
                color: black;
                padding: 15px;
                text-align: center;
            }
        </style>

    </head>
    <body>
      
       
            <div class="container-fluid">
               
                <div class ="row">
                    <div id="box" style="    border: 2px solid lightblue;margin-left: 50px;border-radius: 20px ;" class="col-md-7"> <legend>Own</legend>

                        <%                        //  ServletContext application1 = getServletContext();
                            SQLiteDataSource dataSource = (SQLiteDataSource) application.getAttribute("dataSource");
                            int count = 0;
                                String ID = request.getParameter("idvalue");
                                int userID=  Integer.parseInt(ID);
                            //  int user_id = (int) session.getAttribute("user_id");
                            if (dataSource != null) {
                                Connection dbConn = null;
                                try {
                                    dbConn = dataSource.getConnection();
                                    String queryallString ="SELECT run,debug, program_id FROM `record` WHERE user_id=? order by program_id;";
                    
                                    PreparedStatement allstatement = dbConn.prepareStatement(queryallString);
                                  allstatement.setInt(1, userID);
                                    try (ResultSet allresults = allstatement.executeQuery();) {
                                        while (allresults.next()) {
                                            int photo_id = allresults.getInt("run");
                                           int photoName = allresults.getInt("debug");
                                            int proID = allresults.getInt("program_id");
                                            String counter = String.format("%03d", count);


                        %> 

                        <div style="padding: 20px;" class="row">

                            <div class class="col-md-1">
                                <label >#<%=proID%></label>
                            </div>
                             <div class="col-md-1">
                                    <label >Debug=<%=photoName%></label>
                             </div>
                             <div class="col-md-1">
                                    <label >Run=<%=photo_id%></label>
                             </div>
                           
                           

                        </div>

                        <%  count++;
                                        }
                                    }

                                } catch (SQLException ex) {

                                }
                            }


                        %> 
                    </div>     

                  
                </div>
               
             
                
            </div>
        
    </body>
</html>

