<%-- 
    Document   : if-else
    Created on : Feb 21, 2022, 2:50:06 PM
    Author     : theth
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.sqlite.SQLiteDataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
        <title>if-else</title>



        <style>
            *{box-sizing: border-box}
            body {
                background-color: #d6d6d8;

            }
            .mainDiv {
                height:auto;
                width:100%;
                background-color: #d6d6d8;

            }
            .buttonDiv{
                height:auto;
                background-color:none;
                right: 1%;
                top: 2%;
                position: fixed;
            }
            .button{
                margin-left: 0px; 
                border-style: outset; 
                color: white;
                font-style:oblique;
                font-size:20px;
                border-radius:10px;
                width:90%;
                background-color: #102b5a;
                margin: 5px;
            }
            .buttonSubmit{
                background-color:#102b5a; 
                border: outset;
                border-style: outset; 
                color: white;
                font-size:12px;
                border-radius:10px;
                width:auto;
                background-color: #102b5a;
                margin-left:100px;
                margin-top:10px;
                margin-bottom:10px;
            }
            .lineFont{
                color:black; 
                font-size:16px;
                padding: 0px;
                margin: 0px;
            }
            .labelValue{
                height:auto; 
                border-style:outset;
                width:auto;
                background-color: #01a1c1;
                border: bold;

            }
        </style>



        <script>

            var line = 1;
            var num1 = 0;
            var num2 = 0;
            var running = 0;
            var sh = 0;
            //var newC = 0;
//            if (line !== 0) {
//                debug();
//                document.getElementById("demo").innerHTML = line;
//            }


            function show() {
                sh = 1;
                var x = document.getElementById("num1").value;
                var y = document.getElementById("num2").value;


                if (y != "" && x != "") {


                    num1 = parseInt(x);
                    num2 = parseInt(y);

                    var removeValue = document.getElementById('line8-input');
                    document.getElementById('line8-output').removeChild(removeValue);

                    document.getElementById("line8-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line8-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    document.getElementById("line8-value3").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line8-value4").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    if (num1 == num2) {
                        line = 10;
                    } else {
                        line = 11;
                    }


                }
            }


            function debug()
            {
                if (line !== 1 || running === 1)
                    return false;

                if (avg !== 0) {
                    var removeValue = document.getElementById('classAvg');
                    document.getElementById('line17-output').removeChild(removeValue);
                }

                document.getElementById("line1").style.color = "red";
                line = 2;

            }


            function next()
            {


                if (line === 1)
                {
                    return false;
                } else if (line === 2)
                {
                    document.getElementById("line2").style.color = "red";
                    document.getElementById("line1").style.color = "black";

                } else if (line === 3)
                {
                    document.getElementById("line3").style.color = "red";
                    document.getElementById("line2").style.color = "black";

                } else if (line === 4)
                {
                    document.getElementById("line4").style.color = "red";
                    document.getElementById("line3").style.color = "black";

                } else if (line === 5)
                {
                    document.getElementById("line5").style.color = "red";
                    document.getElementById("line4").style.color = "black";
                    document.getElementById("line4-value").innerHTML = '<code class="labelValue">undefined</code>';
                } else if (line === 6)
                {
                    document.getElementById("line6").style.color = "red";
                    document.getElementById("line5").style.color = "black";
                    document.getElementById("line4-value").style.display = "none";
                    document.getElementById("line5-value").innerHTML = '<code class="labelValue">undefined</code>';
                } else if (line === 7)
                {
                    document.getElementById("line7").style.color = "red";
                    document.getElementById("line6").style.color = "black";
                    document.getElementById("line6-output").innerHTML = '<code >Enter two integers, and I will tell you</code>';
                    document.getElementById("line5-value").style.display = "none";
                } else if (line === 8)
                {

                    document.getElementById("line8").style.color = "red";
                    document.getElementById("line7").style.color = "black";
                    document.getElementById("line7-output").innerHTML = '<code">the relationships they satisfy: </code>';

                } else if (line === 9)
                {

                    document.getElementById("line9").style.color = "red";
                    document.getElementById("line8").style.color = "black";
                    document.getElementById("line8-value1").innerHTML = '<code class="labelValue">undefined</code>';
                    document.getElementById("line8-value2").innerHTML = '<code class="labelValue">undefined</code>';
                    document.getElementById("line8-value3").innerHTML = '<code class="labelValue">undefined</code>';
                    document.getElementById("line8-value4").innerHTML = '<code class="labelValue">undefined</code>';
                    document.getElementById("line8-output").innerHTML = `
                    <div class="row"  id="line8-input" style="margin-left:10px;">
            
                        <div class="row"  >
                        <label for="num1">num1:</label>
                        <input type="number"  id="num1" class="form-control" style="border:ridge;border-width: 2px; border-color: #102b5a;"  required>
                        </div>
            
                        <div class="row" >
                            <label for="num2">num2:</label>
                            <input type="number"  id="num2" class="form-control" style="border:ridge;border-width: 2px; border-color: #102b5a;"  required>
                        </div>
            
                        <button onclick="show()" class="buttonSubmit"  >Submit</button>
                    </div>
`;
                    document.getElementById("line8-output").scrollIntoView();

                } else if (line === 10)
                {


                    document.getElementById("line10").style.color = "red";

                    document.getElementById("line9").style.color = "black";
                    document.getElementById("line8-value1").style.display = "none";
                    document.getElementById("line8-value2").style.display = "none";
                    document.getElementById("line8-value3").style.display = "none";
                    document.getElementById("line8-value4").style.display = "none";

                    document.getElementById("line8-output").style.display = "none";

                    document.getElementById("line9-value1").innerHTML = '<code  class="labelValue">' + num1 + '</code>';
                    document.getElementById("line9-value2").innerHTML = '<code  class="labelValue">' + num2 + '</code>';

                } else if (line === 11)
                {
                    document.getElementById("line11").style.color = "red";

                    if (num1 == num2) {
                        document.getElementById("line10").style.color = "black";

                        document.getElementById("line10-value1").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line10-value2").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';
                        document.getElementById("line10-value3").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line10-value4").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';

                        document.getElementById("line10-output").innerHTML = '<code">' + num1 + ' is equal to ' + num2 + '</code>';

                        document.getElementById("line9-value1").style.display = "none";
                        document.getElementById("line9-value2").style.display = "none";
                    } else {
                        document.getElementById("line9").style.color = "black";
                        document.getElementById("line8-value1").style.display = "none";
                        document.getElementById("line8-value2").style.display = "none";
                        document.getElementById("line8-value3").style.display = "none";
                        document.getElementById("line8-value4").style.display = "none";

                        document.getElementById("line9-value1").innerHTML = '<code  class="labelValue">' + num1 + '</code>';
                        document.getElementById("line9-value2").innerHTML = '<code  class="labelValue">' + num2 + '</code>';
                    }

                } else if (line === 12)
                {
                    document.getElementById("line12").style.color = "red";
                    document.getElementById("line11").style.color = "black";

                    if (num1 != num2) {
                        document.getElementById("line9-value1").style.display = "none";
                        document.getElementById("line9-value2").style.display = "none";
                        line = 12;
                    } else {
                        document.getElementById("line10-value1").style.display = "none";
                        document.getElementById("line10-value2").style.display = "none";
                        document.getElementById("line10-value3").style.display = "none";
                        document.getElementById("line10-value4").style.display = "none";
                        line = 13;
                    }

                } else if (line === 13)
                {
                    document.getElementById("line13").style.color = "red";
                    document.getElementById("line12").style.color = "black";
                    document.getElementById("line12-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line12-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';


                } else if (line === 14)
                {

                    document.getElementById("line14").style.color = "red";

                    if (num1 != num2) {
                        document.getElementById("line13").style.color = "black";

                        document.getElementById("line12-value1").style.display = "none";
                        document.getElementById("line12-value2").style.display = "none";

                        document.getElementById("line13-value1").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line13-value2").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';
                        document.getElementById("line13-value3").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line13-value4").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';

                        document.getElementById("line13-output").innerHTML = '<code">' + num1 + ' is not equal to ' + num2 + '</code>';
                    } else {
                        document.getElementById("line12").style.color = "black";
                        document.getElementById("line12-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                        document.getElementById("line12-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    }


                } else if (line === 15)
                {
                    document.getElementById("line15").style.color = "red";
                    document.getElementById("line14").style.color = "black";
                    if (num1 != num2) {
                        document.getElementById("line13-value1").style.display = "none";
                        document.getElementById("line13-value2").style.display = "none";
                        document.getElementById("line13-value3").style.display = "none";
                        document.getElementById("line13-value4").style.display = "none";

                    } else {
                        document.getElementById("line12-value1").style.display = "none";
                        document.getElementById("line12-value2").style.display = "none";

                    }
                    if (num1 < num2)
                        line = 15;
                    else
                        line = 16;



                } else if (line === 16)
                {
                    document.getElementById("line16").style.color = "red";
                    document.getElementById("line15").style.color = "black";

                    document.getElementById("line15-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line15-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';

                } else if (line === 17)//14
                {
                    document.getElementById("line17").style.color = "red";
                    if (num1 < num2) {
                        document.getElementById("line16").style.color = "black";

                        document.getElementById("line15-value1").style.display = "none";
                        document.getElementById("line15-value2").style.display = "none";

                        document.getElementById("line16-value1").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line16-value2").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';
                        document.getElementById("line16-value3").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line16-value4").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';

                        document.getElementById("line16-output").innerHTML = '<code">' + num1 + ' is less than ' + num2 + '</code>';
                    } else {
                        document.getElementById("line15").style.color = "black";
                        document.getElementById("line15-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                        document.getElementById("line15-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    }


                } else if (line === 18)//15
                {
                    document.getElementById("line18").style.color = "red";
                    document.getElementById("line17").style.color = "black";

                    if (num1 <= num2) {
                        document.getElementById("line16-value1").style.display = "none";
                        document.getElementById("line16-value2").style.display = "none";
                        document.getElementById("line16-value3").style.display = "none";
                        document.getElementById("line16-value4").style.display = "none";
                        line = 19;
                        document.getElementById("line15-value1").style.display = "none";
                        document.getElementById("line15-value2").style.display = "none";
                    } else {
                        document.getElementById("line15-value1").style.display = "none";
                        document.getElementById("line15-value2").style.display = "none";
                        line = 18;
                    }

                } else if (line === 19)
                {
                    document.getElementById("line19").style.color = "red";
                    document.getElementById("line18").style.color = "black";

                    document.getElementById("line18-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line18-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                } else if (line === 20)//17
                {
                    document.getElementById("line20").style.color = "red";
                    if (num1 > num2) {
                        document.getElementById("line19").style.color = "black";

                        document.getElementById("line18-value1").style.display = "none";
                        document.getElementById("line18-value2").style.display = "none";

                        document.getElementById("line19-value1").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line19-value2").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';
                        document.getElementById("line19-value3").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line19-value4").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';

                        document.getElementById("line19-output").innerHTML = '<code">' + num1 + ' is greater than ' + num2 + '</code>';
                    } else {
                        document.getElementById("line18").style.color = "black";
                        document.getElementById("line18-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                        document.getElementById("line18-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    }

                } else if (line === 21)//18
                {
                    document.getElementById("line21").style.color = "red";
                    document.getElementById("line20").style.color = "black";

                    document.getElementById("line19-value1").style.display = "none";
                    document.getElementById("line19-value2").style.display = "none";
                    document.getElementById("line19-value3").style.display = "none";
                    document.getElementById("line19-value4").style.display = "none";

                    document.getElementById("line18-value1").style.display = "none";
                    document.getElementById("line18-value2").style.display = "none";

                    if (num1 <= num2) {

                        line = 21;

                    } else {

                        line = 22;
                    }

                } else if (line === 22)//19
                {
                    document.getElementById("line22").style.color = "red";
                    document.getElementById("line21").style.color = "black";

                    document.getElementById("line21-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line21-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';

                } else if (line === 23)//20
                {
                    document.getElementById("line23").style.color = "red";
                    document.getElementById("line21").style.color = "black";
                    if (num1 <= num2) {
                        document.getElementById("line22").style.color = "black";

                        document.getElementById("line21-value1").style.display = "none";
                        document.getElementById("line21-value2").style.display = "none";

                        document.getElementById("line22-value1").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line22-value2").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';
                        document.getElementById("line22-value3").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line22-value4").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';

                        document.getElementById("line22-output").innerHTML = '<code">' + num1 + ' is less than or equal to ' + num2 + '</code>';
                    } else {

                        document.getElementById("line21-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                        document.getElementById("line21-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    }

                } else if (line === 24)//21
                {
                    document.getElementById("line24").style.color = "red";
                    document.getElementById("line23").style.color = "black";

                    document.getElementById("line22-value1").style.display = "none";
                    document.getElementById("line22-value2").style.display = "none";
                    document.getElementById("line22-value3").style.display = "none";
                    document.getElementById("line22-value4").style.display = "none";

                    document.getElementById("line21-value1").style.display = "none";
                    document.getElementById("line21-value2").style.display = "none";

                    if (num1 >= num2) {

                        line = 24;

                    } else {

                        line = 25;

                    }

                } else if (line === 25)//19
                {
                    document.getElementById("line25").style.color = "red";
                    document.getElementById("line24").style.color = "black";

                    document.getElementById("line24-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                    document.getElementById("line24-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';

                } else if (line === 26)//20
                {
                    document.getElementById("line26").style.color = "red";
                    if (num1 >= num2) {
                        document.getElementById("line25").style.color = "black";
                        document.getElementById("line24").style.color = "black";

                        document.getElementById("line24-value1").style.display = "none";
                        document.getElementById("line24-value2").style.display = "none";

                        document.getElementById("line25-value1").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line25-value2").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';
                        document.getElementById("line25-value3").innerHTML = '<code id="test" class="labelValue">' + num1 + '</code>';
                        document.getElementById("line25-value4").innerHTML = '<code id="test" class="labelValue">' + num2 + '</code>';

                        document.getElementById("line25-output").innerHTML = '<code">' + num1 + ' is greater than or equal to ' + num2 + '</code>';
                    } else {
                        document.getElementById("line24").style.color = "black";
                        document.getElementById("line24-value1").innerHTML = '<code class="labelValue">' + num1 + '</code>';
                        document.getElementById("line24-value2").innerHTML = '<code class="labelValue">' + num2 + '</code>';
                    }

                } else if (line === 27)//19
                {
                    document.getElementById("line27").style.color = "red";
                    document.getElementById("line26").style.color = "black";

                    if (num1 >= num2) {
                        document.getElementById("line25-value1").style.display = "none";
                        document.getElementById("line25-value2").style.display = "none";
                        document.getElementById("line25-value3").style.display = "none";
                        document.getElementById("line25-value4").style.display = "none";

                    } else {
                        document.getElementById("line24-value1").style.display = "none";
                        document.getElementById("line24-value2").style.display = "none";

                    }

                } else if (line === 28)//19
                {
                    document.getElementById("line28").style.color = "red";
                    document.getElementById("line27").style.color = "black";
                } else if (line === 29)//19
                {
                    document.getElementById("line28").style.color = "black";
                }

                line++;
            }
            var i = 1;
            var sum = 0;
            var avg = 0;
            var gra = 0;
            function run()
            {

                document.getElementById("line6-output").innerHTML = '<code >Enter two integers, and I will tell you</code>';
                document.getElementById("line7-output").innerHTML = '<code">the relationships they satisfy: </code>';
                document.getElementById("line8-output").innerHTML = `
                    <div class="row"  id="line8-input" style="margin-left:10px;">
            
                        <div class="row"  >
                        <label for="num1">num1:</label>
                        <input type="number"  id="num1" class="form-control" style="border:ridge;border-width: 2px; border-color: #102b5a;"  required>
                        </div>
            
                        <div class="row" >
                            <label for="num2">num2:</label>
                            <input type="number"  id="num2" class="form-control" style="border:ridge;border-width: 2px; border-color: #102b5a;"  required>
                        </div>
            
                        <button onclick="RunOutput()" class="buttonSubmit"  >Submit</button>
                    </div>
`;
                document.getElementById("line8-output").scrollIntoView();

            }

            function RunOutput()
            {

                var x = document.getElementById("num1").value;
                var y = document.getElementById("num2").value;


                if (y != "" && x != "") {


                    num1 = parseInt(x);
                    num2 = parseInt(y);

                    var removeValue = document.getElementById('line8-input');
                    document.getElementById('line8-output').removeChild(removeValue);

                    if (num1 == num2)
                    {
                        document.getElementById("line10-output").innerHTML = '<code">' + num1 + ' is equal to ' + num2 + '</code>';
                    }
                    if (num1 != num2)
                    {
                        document.getElementById("line13-output").innerHTML = '<code">' + num1 + ' is not equal to ' + num2 + '</code>';
                    }
                    if (num1 < num2)
                    {
                        document.getElementById("line16-output").innerHTML = '<code">' + num1 + ' is less than ' + num2 + '</code>';
                    }
                    if (num1 > num2)
                    {
                        document.getElementById("line19-output").innerHTML = '<code">' + num1 + ' is greater than ' + num2 + '</code>';
                    }
                    if (num1 <= num2)
                    {
                        document.getElementById("line22-output").innerHTML = '<code">' + num1 + ' is less than or equal to ' + num2 + '</code>';
                    }
                    if (num1 >= num2)
                    {
                        document.getElementById("line25-output").innerHTML = '<code">' + num1 + ' is greater than or equal to ' + num2 + '</code>';
                    }
                }
            }
        </script>

    </head>

    <body>

        <div class="container-fluid">


            <div class="row mainDiv"> <!--I.CODES and BUTTONS -->

                <div class="col-md-6"><!--1.1 CODES-->
                    <code id="line1" class="lineFont">#include <stdio.h></code>
                    <pre id="line2" class="lineFont">int main( void )</pre>
                    <pre id="line3" class="lineFont">{</pre>
                    <pre id="line4" class="lineFont " >int num1 <label id="line4-value"></label>;</pre>
                    <pre id="line5" class="lineFont">int num2<label id="line5-value" ></label>;</pre>
                    <pre id="line6" class="lineFont">printf( "Enter two integers, and I will tell you\n" );</pre>
                    <pre id="line7" class="lineFont">printf( "the relationships they satisfy: " );</pre>
                    <pre id="line8" class="lineFont">scanf( "%d<label id="line8-value1" ></label> %d<label id="line8-value2" ></label> ", &num1<label id="line8-value3" ></label> , &num2<label id="line8-value4" ></label> );</pre>
                    <pre id="line9" class="lineFont">if ( num1<label id="line9-value1"></label> == num2<label id="line9-value2"></label> ) {</pre>
                    <pre id="line10" class="lineFont">printf( "%d<label id="line10-value1"></label> is equal to %d<label id="line10-value2"></label> \n", num1<label id="line10-value3"></label> , num2<label id="line10-value4"></label> );</pre>
                    <pre id="line11" class="lineFont">}</pre>
                    <pre id="line12" class="lineFont">if (num1<label id="line12-value1"></label> != num2<label id="line12-value2"></label> ) {</pre>
                    <pre id="line13" class="lineFont">printf( "%d<label id="line13-value1"></label> is not equal to %d<label id="line13-value2"></label> \n", num1<label id="line13-value3"></label> , num2<label id="line13-value4"></label> );</pre>
                    <pre id="line14" class="lineFont">}</pre>
                    <pre id="line15" class="lineFont">if (num1<label id="line15-value1"></label> < num2<label id="line15-value2"></label> ) {</pre>
                    <pre id="line16" class="lineFont">printf( "%d<label id="line16-value1"></label> is less than %d<label id="line16-value2"></label> \n", num1<label id="line16-value3"></label> , num2<label id="line16-value4"></label> );</pre>
                    <pre id="line17" class="lineFont">}</pre>
                    <pre id="line18" class="lineFont">if (num1<label id="line18-value1"></label> > num2<label id="line18-value2"></label> ) {</pre>
                    <pre id="line19" class="lineFont">printf( "%d<label id="line19-value1"></label> is greater than %d<label id="line19-value2"></label> \n", num1<label id="line19-value3"></label> , num2<label id="line19-value4"></label> );</pre>
                    <pre id="line20" class="lineFont">}</pre>
                    <pre id="line21" class="lineFont">if (num1<label id="line21-value1"></label> <= num2<label id="line21-value2"></label> ) {</pre>
                    <pre id="line22" class="lineFont">printf( "%d<label id="line22-value1"></label> is less than or equal to %d<label id="line22-value2"></label> \n", num1<label id="line22-value3"></label> , num2<label id="line22-value4"></label> );</pre>
                    <pre id="line23" class="lineFont">}</pre>
                    <pre id="line24" class="lineFont">if ( num1<label id="line24-value1"></label> >= num2<label id="line24-value2"></label> ) {</pre>
                    <pre id="line25" class="lineFont">printf( "%d<label id="line25-value1"></label> is greater than or equal to %d<label id="line25-value2"></label> \n", num1<label id="line25-value3"></label> , num2<label id="line25-value4"></label> );</pre>
                    <pre id="line26" class="lineFont">} </pre>
                    <pre id="line27" class="lineFont">return 0;</pre>
                    <pre id="line28" class="lineFont">}</pre>





                </div>

                <div class="col-md-3 buttonDiv"> <!--1.2 BUTTONS -->
                    <div class="row ">
                        <a class="button" target="target" href="loopDebugServlet?program_id=1" style="text-decoration:none;cursor:default;width:100%;padding:0 5px 0px 5px;border-color:gray; font-size:20px;"  >DEBUG</a>
                    </div>

                    <div class="row "> 
                        <button onclick="next()" class="button" style="margin-top:10px;margin-bottom:10px;" >NEXT</button>
                    </div>
                    <div class="row ">
                        <a class="button" target="target" href="runServlet?program_id=1" style="text-decoration:none;cursor:default;width:100%;padding:0 20px 0px 20px;border-color:gray; font-size:20px;"  >RUN</a>
                    </div>
                    <div class="row"> 
                        <button onClick="window.location.reload();" style="margin-top:10px;background-color: #6e87a7; color: black;" class="button" >Refresh</button>
                    </div>
                </div>
            </div>


            <div class="row mainDiv" style="background-color: #102b5a;margin-top: 10px;"><!--II.OUTPUT TITLE -->
                <label class="col-md-12" style="color: white; font-size:20px; text-align: center;">OUTPUT</label>
            </div>
            <div class="row mainDiv" style="background-color: #6e87a7;"><!--III.OUTPUT COMPONENTS -->
                <div class="row" id="line6-output" >
                </div>
                <div class="row" id="line7-output" >
                </div>
                <div class="row" id="line8-output" >
                </div>
                <div class="row" id="line10-output" >
                </div>
                <div class="row" id="line13-output" >
                </div>
                <div class="row" id="line16-output" >
                </div>
                <div class="row" id="line19-output" >
                </div>
                <div class="row" id="line22-output">
                </div>
                <div class="row" id="line25-output" >
                </div>
            </div>
        </div>
    </body>
</html>
<%

    int lds = (int) session.getAttribute("lds");

    if (lds == 1) { %>



<script type="text/javascript">
    debug();
</script>
<%   session.setAttribute("lds", 0);
    }
    if (lds == 2) { %>
<script type="text/javascript">
    run();
</script>
<%   session.setAttribute("lds", 0);
    }
%>