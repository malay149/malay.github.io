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
            Student Dashboard
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
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: white;
                
            }
             

        </style>

    </head>
    <!DOCTYPE html>



    <body>
        <div class="container">

            <h1>STUDENT HOME PAGE</h1>
            <table>
                <tr>
                    <th>CHAPTER-1</th>
                    <th>DECISION MAKING</th>
                    <td></td>
                </tr>
                <tr>
                    <td>1.If-else Statement</td>
                    <td>C program that compares two numbers input by the user using if statements, relational operators, and equality operators</td>
                    <td><a href="if-else.jsp" target="target" style="text-decoration: underline;">Learn</a></td>
                </tr>
                <tr>
                    <td>CHAPTER-2</td>
                    <td>LOOPING</td>
                    <td></td>
                </tr>
                <tr>
                    <td>1.While Loop</td>
                    <td>C program that calculates the class average using counter-controlled repetition</td>
                    <td><a href="looping.jsp" target="target" style="text-decoration: underline;" >Learn</a></td>
                </tr>
                <tr>
                    <td>CHAPTER-3</td>
                    <td>FUNCTION</td>
                    <td></td>
                </tr>
                <tr>
                    <td>1.Function</td>
                    <td>C program that uses a function square to calculate and print the squares of the integers from 1 to 10</td>
                    <td><a href="function.jsp" target="target" style="text-decoration: underline;" >Learn</a></td>
                </tr>
                <tr>
                    <td>CHAPTER-4</td>
                    <td>ARRAY</td>
                    <td></td>
                </tr>
                <tr>
                    <td>1.Array</td>
                    <td>C program that initializes an integer array with 10 values and prints the array in tabular format</td>
                    <td><a href="array.jsp" target="target" style="text-decoration: underline;" >Learn</a></td>
                </tr>
                <tr>
                    <td>CHAPTER-5</td>
                    <td>POINTER</td>
                    <td></td>
                </tr>
                <tr>
                    <td>1.Pointer</td>
                    <td>C program that converts a string to uppercase using a non-constant pointer to non-constant data</td>
                    <td><a href="pointer.jsp" target="target" style="text-decoration: underline;" >Learn</a></td>
                </tr>
            </table>

        </div>


    </body>

</html>


