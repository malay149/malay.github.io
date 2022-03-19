<%-- 
    Document   : function
    Created on : Feb 21, 2022, 2:53:20 PM
    Author     : theth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
        <title>Function</title>

        <style>
            *{box-sizing: border-box}
            .mainDiv {
                height:auto;
                width:100%;
                border-style: outset;

                background-color: #d6d6d8;
                margin: none;
                padding:none;
            }
            .buttonDiv{
                height:auto;
                background-color:none;
                right: 1%;
                top: 1%;
                position: fixed;
            }
            .button{
                margin-left: 0px; 
                border-style: outset; 
                color: white;

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
                font-size: 15px;
                color: orange;
            }
        </style>

        <script>
            var status = 0;
            var line = 1;
            var y = 0;
            var x = 0;
            var square = 0;
            
            function debug()
            {
                if(status!=0){
                    refreshAlert();
                    return false;
                }
                status=1;
                if (line !== 1)
                    return false;
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
                    document.getElementById("line2-value").innerHTML = '<code class="labelValue">' + y + '</code>';

                } else if (line === 4)
                {
                    document.getElementById("line4").style.color = "red";
                    document.getElementById("line3").style.color = "black";
                    document.getElementById("line2-value").style.display = "none";

                } else if (line === 5)
                {
                    document.getElementById("line5").style.color = "red";
                    document.getElementById("line4").style.color = "black";

                } else if (line === 6)
                {
                    document.getElementById("line6").style.color = "red";
                    if (x >= 1) {
                        document.getElementById("line13").style.color = "black";

                        var removeValue = document.getElementById('x71');
                        document.getElementById('line7-value1').removeChild(removeValue);
                        removeValue = document.getElementById('x72');
                        document.getElementById('line7-value2').removeChild(removeValue);
                        removeValue = document.getElementById('x73');
                        document.getElementById('line7-value3').removeChild(removeValue);
                    } else {
                        document.getElementById("line5").style.color = "black";
                        document.getElementById("line5-value").innerHTML = '<code class="labelValue">' + x + '</code>';
                    }
                } else if (line === 7)
                {
                    x = parseInt(x) + 1;
                    document.getElementById("line7").style.color = "red";
                    document.getElementById("line6").style.color = "black";

                    document.getElementById("line6-value1").innerHTML = '<code id="x61" class="labelValue">' + x + '</code>';
                    document.getElementById("line6-value2").innerHTML = '<code id="x62" class="labelValue">' + x + '</code>';
                    document.getElementById("line6-value3").innerHTML = '<code id="x63" class="labelValue">' + x + '</code>';

                    document.getElementById("line5-value").style.display = "none";

                } else if (line === 8)
                {

                    document.getElementById("line8").style.color = "red";
                    document.getElementById("line7").style.color = "black";

                    //check if else

                    document.getElementById("line7-value1").innerHTML = '<code id="x71" class="labelValue">' + square + '</code>';
                    document.getElementById("line7-value2").innerHTML = '<code id="x72" class="labelValue">' + x + '</code>';
                    document.getElementById("line7-value3").innerHTML = '<code id="x73" class="labelValue">square(x)=' + square + '</code>';


                    var removeValue = document.getElementById('x61');
                    document.getElementById('line6-value1').removeChild(removeValue);
                    removeValue = document.getElementById('x62');
                    document.getElementById('line6-value2').removeChild(removeValue);
                    removeValue = document.getElementById('x63');
                    document.getElementById('line6-value3').removeChild(removeValue);
                } else if (line === 9)
                {
                    y = parseInt(x);
                    document.getElementById("line9").style.color = "red";
                    document.getElementById("line8").style.color = "black";
                    document.getElementById("line8-value").innerHTML = '<code id="y8" class="labelValue">' + y + '</code>';

                    var removeValue = document.getElementById('x71');
                    document.getElementById('line7-value1').removeChild(removeValue);

                    removeValue = document.getElementById('x72');
                    document.getElementById('line7-value2').removeChild(removeValue);

                    removeValue = document.getElementById('x73');
                    document.getElementById('line7-value3').removeChild(removeValue);

                } else if (line === 10)
                {

                    document.getElementById("line10").style.color = "red";
                    document.getElementById("line9").style.color = "black";

                    var removeValue = document.getElementById('y8');
                    document.getElementById('line8-value').removeChild(removeValue);
                } else if (line === 11)
                {
                    square = parseInt(x) * parseInt(x);
                    document.getElementById("line11").style.color = "red";
                    document.getElementById("line10").style.color = "black";
                    document.getElementById("line10-value1").innerHTML = '<code id="y101" class="labelValue">' + y + '</code>';
                    document.getElementById("line10-value2").innerHTML = '<code id="y102" class="labelValue">' + y + '</code>';
                    document.getElementById("line10-value3").innerHTML = '<code id="y103" class="labelValue">y*y=' + square + '</code>';


                } else if (line === 12)
                {

                    document.getElementById("line7").style.color = "red";
                    document.getElementById("line11").style.color = "black";

                    document.getElementById("line7-value1").innerHTML = '<code id="x71" class="labelValue">' + square + '</code>';
                    document.getElementById("line7-value2").innerHTML = '<code id="x72" class="labelValue">' + x + '</code>';
                    document.getElementById("line7-value3").innerHTML = '<code id="x73" class="labelValue">square(x)=' + square + '</code>';



                    var removeValue = document.getElementById('y101');
                    document.getElementById('line10-value1').removeChild(removeValue);
                    removeValue = document.getElementById('y102');
                    document.getElementById('line10-value2').removeChild(removeValue);
                    removeValue = document.getElementById('y103');
                    document.getElementById('line10-value3').removeChild(removeValue);

                } else if (line === 13)
                {
                    document.getElementById("line13").style.color = "red";
                    document.getElementById("line7").style.color = "black";
                    document.getElementById("line7-value1").innerHTML = '<code id="x71" class="labelValue">' + square + '</code>';
                    document.getElementById("line7-value2").innerHTML = '<code id="x72" class="labelValue">' + x + '</code>';
                    document.getElementById("line7-value3").innerHTML = '<code id="x73" class="labelValue">square(x)=' + square + '</code>';


                    switch (x) {
                        case 1:
                            document.getElementById("line7-output").innerHTML = '1';
                            break;
                        case 2:
                            document.getElementById("line7-output").innerHTML = '1 4 ';
                            break;
                        case 3:
                            document.getElementById("line7-output").innerHTML = '1 4 9 ';
                            break;
                        case 4:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 ';
                            break;
                        case 5:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 25 ';
                            break;
                        case 6:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 25 36 ';
                            break;
                        case 7:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 25 36 49 ';
                        case 8:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 25 36 49 64 ';
                            break;
                        case 9:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 25 36 49 64 81';
                            break;
                        case 10:
                            document.getElementById("line7-output").innerHTML = '1 4 9 16 25 36 49 64 81 100';
                            break;


                    }

                    if (x < 10)
                    {
                        line = 5;

                    }



                } else if (line === 14)
                {
                    //var saveTotal = parseInt(total) ;
                    document.getElementById("line14").style.color = "red";
                    document.getElementById("line13").style.color = "black";

                    var removeValue = document.getElementById('x71');
                    document.getElementById('line7-value1').removeChild(removeValue);
                    removeValue = document.getElementById('x72');
                    document.getElementById('line7-value2').removeChild(removeValue);
                    removeValue = document.getElementById('x73');
                    document.getElementById('line7-value3').removeChild(removeValue);

                } else if (line === 15)
                {

                    document.getElementById("line15").style.color = "red";
                    document.getElementById("line14").style.color = "black";



                } else if (line === 16)
                {

                    document.getElementById("line15").style.color = "black";

                }
                line++;
            }

            function run()
            {
                 if(status!=0){
                    refreshAlert();
                    return false;
                }
                 status=2;
                document.getElementById("line7-output").innerHTML = '1 4 9 16 25 36 49 64 81 100';
            }
function refreshAlert() {
  
  if (confirm("Please refresh the page to start again!")) {
    window.location.reload();
  } 
 
}

        </script>

    </head>

    <body>

        <div class="container-fluid">


            <div class="row mainDiv"> <!--I.CODES and BUTTONS -->

                <div class="col-md-6"><!--1.1 CODES-->
                    <code id="line1" class="lineFont" >#include  </code>
                    <pre id="line2" class="lineFont">int square( int y<label id="line2-value"></label> );</pre>
                    <pre id="line3" class="lineFont">int main( void )</pre>
                    <pre id="line4" class="lineFont" >{</pre>
                    <pre id="line5" class="lineFont">int x<label id="line5-value" ></label> ;</pre>
                    <pre id="line6" class="lineFont">for ( x<label id="line6-value1" ></label> = 1; x<label id="line6-value2" ></label> <= 10; x<label id="line6-value3" ></label>++ ) {</pre>
                    <pre id="line7" class="lineFont">printf( "%d<label id="line7-value1" ></label>", square(x<label id="line7-value2" ></label>)); <label id="line7-value3" ></label></pre>
                    <pre id="line13" class="lineFont">}</pre>

                    <pre id="line14" class="lineFont">return 0;</pre>
                    <pre id="line15" class="lineFont">} </pre>
                    <pre> </pre>
                    <pre id="line8" class="lineFont">int square( int y<label  id="line8-value"></label> )</pre>
                    <pre id="line9" class="lineFont">{ </pre>
                    <pre id="line10" class="lineFont">return y<label  id="line10-value1"></label> * y<label  id="line10-value2"></label>; <label  id="line10-value3"></label> </pre>
                    <pre id="line11" class="lineFont">}</pre>

                </div>

                <div class="col-md-3 buttonDiv"> <!--1.2 BUTTONS -->
                    <div class="row ">
                        <a class="button" target="target" href="loopDebugServlet?program_id=3" style="text-decoration:none;cursor:default;width:100%;padding:0 5px 0px 5px;border-color:gray; font-size:20px;"  >DEBUG</a>
                    </div>
                
                    <div class="row "> 
                        <button onclick="next()" class="button" style="margin-top:10px;margin-bottom:10px;" >NEXT</button>
                    </div>
                    <div class="row ">
                        <a class="button" target="target" href="runServlet?program_id=3" style="text-decoration:none;cursor:default;width:100%;padding:0 20px 0px 20px;border-color:gray; font-size:20px;"  >RUN</a>
                    </div>
                    <div class="row"> 
                        <button onClick="window.location.reload();" style="margin-top:10px;background-color: #6e87a7; color: black;" class="button" >Refresh</button>
                    </div>
                </div>
            </div>
            <div class="row mainDiv" style="background-color: #102b5a;"><!--II.OUTPUT TITLE -->
                <label class="col-md-12" style="color: white; font-size:20px; text-align: center;">OUTPUT</label>
            </div>
            <div class="row mainDiv" style="background-color: #6e87a7;"><!--III.OUTPUT COMPONENTS -->
                <pre id="line7-output" class="lineFont"></pre>
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
