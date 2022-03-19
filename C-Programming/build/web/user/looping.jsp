<%-- 
    Document   : looping
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
        <title>Looping</title>



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
                right:50%;
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
                margin:10px;
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
            var counter = 0;
            var grade = 0;
            var total = 0;
            var average = 0;
            var running = 0;
            var sh = 0;
            //var newC = 0;
//            if (line !== 0) {
//                debug();
//                document.getElementById("demo").innerHTML = line;
//            }


            function show() {
                sh = 1;
                var y = document.getElementById("grade").value;
                //var y = document.forms["gradeForm"]["grade"].value;

                if (y !== "") {
                    line = 13;
                    grade = parseInt(y);
                    if (!(grade >= 0)) {
                        grade = 0;
                    }

                    next();
                    var removeValue = document.getElementById('enterG');
                    document.getElementById('line11-output').removeChild(removeValue);

                    removeValue = document.getElementById('line12-output1');
                    document.getElementById('line12-output').removeChild(removeValue);

                    removeValue = document.getElementById('line12-output2');
                    document.getElementById('line12-output').removeChild(removeValue);
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
                    //document.getElementById("line4-value").innerHTML = counter;
                    //document.getElementById("line4-value").className = "labelValue";
                    document.getElementById("line4-value").innerHTML = '<code class="labelValue">' + counter + '</code>';
                } else if (line === 6)
                {
                    document.getElementById("line6").style.color = "red";
                    document.getElementById("line5").style.color = "black";
                    document.getElementById("line4-value").style.display = "none";
                    document.getElementById("line5-value").innerHTML = '<code class="labelValue">' + grade + '</code>';
                } else if (line === 7)
                {
                    document.getElementById("line7").style.color = "red";
                    document.getElementById("line6").style.color = "black";
                    document.getElementById("line6-value").innerHTML = '<code class="labelValue">' + total + '</code>';
                    document.getElementById("line5-value").style.display = "none";
                } else if (line === 8)
                {
                    total = 0;
                    document.getElementById("line8").style.color = "red";
                    document.getElementById("line7").style.color = "black";
                    document.getElementById("line7-value").innerHTML = '<code class="labelValue">' + average + '</code>';
                    document.getElementById("line6-value").style.display = "none";
                } else if (line === 9)
                {
                    counter = 1;
                    document.getElementById("line9").style.color = "red";
                    document.getElementById("line8").style.color = "black";
                    document.getElementById("line8-value").innerHTML = '<code class="labelValue">' + total + '</code>';
                    document.getElementById("line7-value").style.display = "none";

                } else if (line === 10)
                {
                    if (counter > 1) {
                        document.getElementById("line15").style.color = "black";

                        var removeValue = document.getElementById('c1');
                        document.getElementById('line14-valueC1').removeChild(removeValue);
                        removeValue = document.getElementById('c2');
                        document.getElementById('line14-valueC2').removeChild(removeValue);
                    }

                    document.getElementById("line10").style.color = "red";
                    document.getElementById("line9").style.color = "black";
                    document.getElementById("line9-value").innerHTML = '<code class="labelValue">' + counter + '</code>';
                    document.getElementById("line8-value").style.display = "none";
                } else if (line === 11)
                {
                    document.getElementById("line11").style.color = "red";
                    document.getElementById("line10").style.color = "black";
                    document.getElementById("line10-value").innerHTML = '<code id="test" class="labelValue">' + counter + '</code>';
                    document.getElementById("line9-value").style.display = "none";

                    //  document.getElementById("line10-value").style.display = "block";
                    //    var y = document.createElement("code");
//            y.setAttribute("type", "text");
//            y.setAttribute("class", "labelValue");
//            y.setAttribute("value", counter);
                    //var y = '<code class="labelValue">' + counter + '</code>';
                    // document.getElementById("line10-value").innerHTML.appendChild(y);

                } else if (line === 12)
                {
                    document.getElementById("line12").style.color = "red";
                    document.getElementById("line11").style.color = "black";
                    // document.getElementById("line11-output").style.display = "block";
                    document.getElementById("line11-output").innerHTML = ' <label class="col-md-12" id="enterG" style="text-color:black; font-size:20px; ">Enter grade: </label>  ';
                    document.getElementById("line11-output").scrollIntoView();

                    var removeValue = document.getElementById('test');
                    document.getElementById('line10-value').removeChild(removeValue);
                } else if (line === 13)
                {
                    document.getElementById("line13").style.color = "red";
                    document.getElementById("line12").style.color = "black";
                    // document.getElementById("line12-output").style.display = "block";

                    document.getElementById("line12-value1").innerHTML = '<code id="l12v1" class="labelValue">' + grade + '</code>';
                    document.getElementById("line12-value2").innerHTML = '<code id="l12v2" class="labelValue">' + grade + '</code>';
                    document.getElementById("line12-output").innerHTML = `
 <div class="row" id="line12-output1" >
                            <div class="col-md-4"><input type="number" name="grade" id="grade" class="form-control" style="border:ridge;border-width: 2px; border-color: #102b5a;"  required></div>
                        </div>
                         <button onclick="show()" id="line12-output2" class="col-md-1 buttonSubmit"  >Submit</button>
`;

                } else if (line === 14)
                {
                    //var saveTotal = parseInt(total) ;
                    document.getElementById("line14").style.color = "red";
                    document.getElementById("line13").style.color = "black";
                    document.getElementById("line13-valueT2").innerHTML = '<code id="t2" class="labelValue">' + total + '</code>';
                    total = parseInt(total) + parseInt(grade);

                    document.getElementById("line13-valueT1").innerHTML = '<code id="t1" class="labelValue">' + total + '</code>';

                    document.getElementById("line13-valueG").innerHTML = '<code id="g" class="labelValue">' + grade + '</code>';

                    grade = 0;
                    document.getElementById('line12-value1').removeChild(document.getElementById('l12v1'));
                    document.getElementById('line12-value2').removeChild(document.getElementById('l12v2'));


                    if (sh != 1) {
                        var removeValue = document.getElementById('enterG');
                        document.getElementById('line11-output').removeChild(removeValue);

                        removeValue = document.getElementById('line12-output1');
                        document.getElementById('line12-output').removeChild(removeValue);

                        removeValue = document.getElementById('line12-output2');
                        document.getElementById('line12-output').removeChild(removeValue);
                    }
                } else if (line === 15)
                {
                    //var newC = parseInt(counter)+1;
                    document.getElementById("line15").style.color = "red";
                    document.getElementById("line14").style.color = "black";

                    document.getElementById("line14-valueC2").innerHTML = '<code class="labelValue" id="c2" >' + counter + '</code>';
                    counter = parseInt(counter) + 1;
                    document.getElementById("line14-valueC1").innerHTML = '<code class="labelValue" id="c1" >' + counter + '</code>';



                    var removeValue = document.getElementById('t1');
                    document.getElementById('line13-valueT1').removeChild(removeValue);

                    removeValue = document.getElementById('t2');
                    document.getElementById('line13-valueT2').removeChild(removeValue);

                    removeValue = document.getElementById('g');
                    document.getElementById('line13-valueG').removeChild(removeValue);

                    if (counter <= 10)
                    {
                        line = 9;

                    }

                } else if (line === 16)
                {
//                    if (counter <= 10)
//                    {
//                        line = 9;
//                        counter++;
//                        document.getElementById("line15").style.color = "black";
//
//                       
//
//                        var removeValue = document.getElementById('c1');
//                        document.getElementById('line14-valueC1').removeChild(removeValue);
//                        removeValue = document.getElementById('c2');
//                        document.getElementById('line14-valueC2').removeChild(removeValue);
//
//                    } else
//                    {
                    document.getElementById("line16").style.color = "red";
                    document.getElementById("line15").style.color = "black";

                    var removeValue = document.getElementById('c1');
                    document.getElementById('line14-valueC1').removeChild(removeValue);
                    removeValue = document.getElementById('c2');
                    document.getElementById('line14-valueC2').removeChild(removeValue);
//                    }
                } else if (line === 17)
                {
                    document.getElementById("line17").style.color = "red";
                    document.getElementById("line16").style.color = "black";
                    // document.getElementById("line11-output").style.display = "block";
                    average = parseInt(total) / 10;
                    document.getElementById("line16-valueA").innerHTML = '<code class="labelValue" id="valueA" >' + average + '</code>';
                    document.getElementById("line16-valueT").innerHTML = '<code class="labelValue" id="valueT" >' + total + '</code>';


                } else if (line === 18)
                {
                    document.getElementById("line18").style.color = "red";
                    document.getElementById("line17").style.color = "black";
                    // document.getElementById("line17-output").style.display = "block"; 

                    document.getElementById("line17-valueA").innerHTML = '<code class="labelValue" id="value17A" >' + average + '</code>';
                    document.getElementById("line17-valueD").innerHTML = '<code class="labelValue" id="value17D" >' + average + '</code>';
                    document.getElementById("line17-output").innerHTML = '<label class="col-md-12" id="classAvg"  style="text-color:black; font-size:20px; ">Class average is ' + average + ' </label>';
                    document.getElementById("line17-output").scrollIntoView();

                    document.getElementById("line16-valueA").style.display = "none";
                    document.getElementById("line16-valueT").style.display = "none";

                } else if (line === 19)
                {
                    document.getElementById("line19").style.color = "red";
                    document.getElementById("line18").style.color = "black";


                    var removeValue = document.getElementById('value17A');
                    document.getElementById('line17-valueA').removeChild(removeValue);
                    removeValue = document.getElementById('value17D');
                    document.getElementById('line17-valueD').removeChild(removeValue);
                } else if (line === 20)
                {
                    document.getElementById("line19").style.color = "black";

                }
                line++;
            }
            var i = 1;
            var sum = 0;
            var avg = 0;
            var gra = 0;
            function run()
            {
                running = 1;
                if (line > 1) {
                    return false;
//                    var removeValue = document.getElementById('classAvg');
//                    document.getElementById('line17-output').removeChild(removeValue);
                }
                if (i <= 10)
                {
                    document.getElementById("line11-output").innerHTML = ' <label class="col-md-12" id="enterG" style="text-color:black; font-size:20px; ">' + i + '. Enter grade: </label>  ';
                    //document.getElementById("iValueOutput").innerHTML = '<code  id="ivalue" >' + i + '</code>';
                    document.getElementById("line12-output").innerHTML = `
 <div class="row" id="line12-output1" >
                            <div class="col-md-4"><input type="number" name="grade" id="grade" class="form-control" style="border:ridge;border-width: 2px; border-color: #102b5a;"  required></div>
                        </div>
                         <button onclick="RunOutput()"  id="line12-output2" class="col-md-1 buttonSubmit"  >Submit</button>
`;
            document.getElementById("line12-output").scrollIntoView();

                } else {
                    avg = parseInt(sum) / 10;
                    document.getElementById("line17-output").innerHTML = '<label class="col-md-12" id="classAvg"  style="text-color:black; font-size:20px; ">Class average is ' + avg + ' </label>';

                }
            }

            function RunOutput()
            {
                var y = document.getElementById("grade").value;
                gra = parseInt(y);
                if (!(gra >= 0)) {
                    gra = 0;
                }
                sum = parseInt(sum) + parseInt(gra);
                i++;
                var removeValue = document.getElementById('enterG');
                document.getElementById('line11-output').removeChild(removeValue);

                removeValue = document.getElementById('line12-output1');
                document.getElementById('line12-output').removeChild(removeValue);

                removeValue = document.getElementById('line12-output2');
                document.getElementById('line12-output').removeChild(removeValue);
                run();
            }
        </script>

    </head>

    <body>

        <div class="container-fluid">


            <div class="row mainDiv"> <!--I.CODES and BUTTONS -->

                <div class="col-md-4"><!--1.1 CODES-->
                    <code id="line1" class="lineFont" >#include  </code>
                    <pre id="line2" class="lineFont">int main( void )</pre>
                    <pre id="line3" class="lineFont">{</pre>
                    <pre id="line4" class="lineFont" >int counter<label id="line4-value"></label>;</pre>
                    <pre id="line5" class="lineFont">int grade<label id="line5-value" ></label>;</pre>
                    <pre id="line6" class="lineFont">int total<label id="line6-value" ></label>; </pre>
                    <pre id="line7" class="lineFont">int average<label id="line7-value" ></label>;</pre>
                    <pre id="line8" class="lineFont">total <label id="line8-value" ></label> = 0;</pre>
                    <pre id="line9" class="lineFont">counter <label  id="line9-value"></label> = 1;</pre>
                    <pre id="line10" class="lineFont">while (counter <label id="line10-value"></label> <= 10 ) {</pre>
                    <pre id="line11" class="lineFont">printf( "Enter grade: " );</pre>
                    <pre id="line12" class="lineFont">scanf( "%d<label id="line12-value1"></label>", &grade <label id="line12-value2"></label> ); </pre>
                    <pre id="line13" class="lineFont">total <label  id="line13-valueT1" ></label> = total<label  id="line13-valueT2" ></label> + grade<label  id="line13-valueG" ></label>; </pre>
                    <pre id="line14" class="lineFont">counter <label  id="line14-valueC1"></label>= counter <label  id="line14-valueC2"></label> + 1;</pre>
                    <pre id="line15" class="lineFont">}</pre>
                    <pre id="line16" class="lineFont">average<label  id="line16-valueA"></label> = total<label  id="line16-valueT"></label> / 10;</pre>
                    <pre id="line17" class="lineFont">printf( "Class average is %d<label  id="line17-valueD"></label>\n", average<label  id="line17-valueA"></label> ); </pre>
                    <pre id="line18" class="lineFont">return 0;</pre>
                    <pre id="line19" class="lineFont">}</pre>
                </div>

                <div class="col-md-3 buttonDiv"> <!--1.2 BUTTONS -->
                    <div class="row ">
                        <a class="button" target="target" href="loopDebugServlet?program_id=2" style="text-decoration:none;cursor:default;width:100%;padding:0 5px 0px 5px;border-color:gray; font-size:20px;"  >DEBUG</a>
                    </div>
                
                    <div class="row "> 
                        <button onclick="next()" class="button" style="margin-top:10px;margin-bottom:10px;" >NEXT</button>
                    </div>
                    <div class="row ">
                        <a class="button" target="target" href="runServlet?program_id=2" style="text-decoration:none;cursor:default;width:100%;padding:0 20px 0px 20px;border-color:gray; font-size:20px;"  >RUN</a>
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
                <div class="row" id="line11-output" style="height:auto;text-align: center;">
                </div>
                <div class="row" id="line17-output" style="height:auto;text-align: center;">
                </div>
                <div class="row" id="line12-output" style="height:auto;text-align: center;">
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