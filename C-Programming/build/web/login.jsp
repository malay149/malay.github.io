<%-- 
    Document   : login
    Created on : Jun 2, 2021, 8:46:27 PM
    Author     : theth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head >
        <title >TECHNICAL PROGRAMMING</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
    </head>
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

            h2 {
                font-size: 40px;
                margin-bottom: 20px;
                font-weight: bold;
                color: white;
                
            }
            .myclass{
                background:#102b5a;
                text-align: center;
                height: 100px;
                padding: 20px;
            }
            .container {
                width: 1140px;
                margin: 20px auto 0 auto;

            }
            .button{
                
                color: white;
                
                font-size:20px;
                border-radius:10px;
                width:90%;
                background-color: #102b5a;
                margin-left: 450px;
            }
           

        </style>
    <body>
        <div class="myclass">
       
            <h2>TECHNICAL PROGRAMMING</h2>
       
        </div>
        <div class="container-fluid">
            <form action="validateServlet" method="post" >
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
                    <div class="col-md-5"><input type="text" name="name" class="form-control" required></div>
                </div>

                <div class="col-md-12" style="height:5px"></div>
                <div class="row">
                    <div class="col-md-2" ></div>
                    <label class="col-md-2">Password:</label> 
                    <div class="col-md-5"><input type="text" name="secret" class="form-control" required></div>
                </div>
                <div class="col-md-12" style="height:20px"></div>

                
                
                <div class="row"> 
                    <div class="col-md-4" ></div>
                    <div class="col-md-7"> <label><input id="idRadio" type="radio" class="form-check-input" name="role" value="Teacher" required>Teacher</label></div>

                </div>
                <div class="row"> 
                    <div class="col-md-4" ></div>
                    <div class="col-md-7"> <label><input id="idRadio" type="radio" class="form-check-input" name="role" value="Student" required>Student</label></div>

                </div>
                <div class="col-md-12" style="height:40px"></div>
                <div class="row" > 
                    <div class="col-md-1" ></div>

                    <input type="submit" class="col-md-2 button" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>
