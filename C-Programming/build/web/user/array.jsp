<%-- 
    Document   : Array
    Created on : Feb 13, 2022, 7:06:49 PM
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
        <title>Array</title>

        <style>
            *{
                box-sizing: border-box;
                margin: 0;
                padding: 0;

            }
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
            table {
                font-family: arial, sans-serif;
                width:auto;
            }

            td, th {
                border: 1px solid black;
                text-align: left;
                padding: 3px;
            }

            td:nth-child(odd) {
                background-color:#6e87a7;
            }
            td:nth-child(even) {
                background-color:white;
                width:50px;
            }

            .clearfix:after {
                content: "";
                display: table;
                clear: both;
            }
            .container {
                width: 100%;
                margin: 0 auto 0 auto;
            }

            .blog-post {
                width: 50%;
                float: left;
                margin-right:10px;
                margin-bottom: 30px;
                position: relative;
            }

            .other-posts {
                width:auto;
                float: left;
            }

            .author-box {
                padding-top: 20px;
                border-top: 1px solid #808080;
            }

            .other {
                margin-bottom: 40px;
            }
        </style>

        <script>

            var line = 1;
            var y = 0;
            var j = 0;
            var myrow = 1;
var status = 0;
            

            function addRow(tableID) {
                // Get a reference to the table
                let tableRef = document.getElementById(tableID);

                // Insert a row at the end of the table
                let newRow = tableRef.insertRow(0);

                // Insert a cell in the row at index 0
                let newCell = newRow.insertCell(0);

                // Append a text node to the cell<td>s[j]</td><td>2+ 2*j</td>
                            
                let newText = document.createTextNode('s[ j ]');
                newCell.appendChild(newText);
                
               // let newRow1 = tableRef.insertRow(0);

                // Insert a cell in the row at index 0
                let newCell1 = newRow.insertCell(1);

                // Append a text node to the cell<td>s[j]</td><td>2+ 2*j</td>
                            
                let newText1 = document.createTextNode('2+ 2*j');
                newCell1.appendChild(newText1);
            }
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
                    document.getElementById("line2-value").innerHTML = '<code class="labelValue">SIZE=10</code>';

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
                    document.getElementById("line5").style.color = "black";
                    document.getElementById("line5-value1").innerHTML = '<code class="labelValue" id="size51" >10</code>';
                    document.getElementById("line5-value2").innerHTML = `
                    <table id="mytable" >
                       
                        <tr>
                            <td>s[0]</td>
                            <td>    </td>
                        </tr>
                        <tr>
                            <td>s[1]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[2]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[3]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[4]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[5]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[6]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[7]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[8]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>s[9]</td>
                            <td>  </td>
                        </tr>
                    </table>`;

                } else if (line === 7)
                {
                    document.getElementById("line7").style.color = "red";
                    if (j >= 1) {
                        document.getElementById("line9").style.color = "black";

                        var removeValue = document.getElementById('j81');
                        document.getElementById('line8-value1').removeChild(removeValue);
                        removeValue = document.getElementById('j82');
                        document.getElementById('line8-value2').removeChild(removeValue);
                        removeValue = document.getElementById('j83');
                        document.getElementById('line8-value3').removeChild(removeValue);
                    } else {
                        document.getElementById("line6").style.color = "black";
                         document.getElementById("line6-value").innerHTML = '<code class="labelValue" id="j6" style="width:30px;" >' + j + '</code>';
                        var removeValue = document.getElementById('size51');
                        document.getElementById('line5-value1').removeChild(removeValue);
                    }
                } else if (line === 8)
                {
                    
                    document.getElementById("line8").style.color = "red";
                    document.getElementById("line7").style.color = "black";

                    //check if else

                    document.getElementById("line7-value1").innerHTML = '<code id="j71" class="labelValue">' + j + '</code>';
                    document.getElementById("line7-value2").innerHTML = '<code id="j72" class="labelValue">' + j + '</code>';
                    document.getElementById("line7-value3").innerHTML = '<code id="j73" class="labelValue">10</code>';
                    document.getElementById("line7-value4").innerHTML = '<code id="j74" class="labelValue">' + j + '</code>';

                    if(j===0) {
                    var removeValue = document.getElementById('j6');
                    document.getElementById('line6-value').removeChild(removeValue);
                    }
                } else if (line === 9)
                {
                    
                    document.getElementById("line9").style.color = "red";
                    document.getElementById("line8").style.color = "black";
                    
                    y = parseInt(j);
                    y = 2+ (2*y);
                    document.getElementById("line8-value1").innerHTML = '<code id="j81" class="labelValue">' + j + '</code>';
                    document.getElementById("line8-value2").innerHTML = '<code id="j82" class="labelValue">' + j + '</code>';
                    document.getElementById("line8-value3").innerHTML = '<code id="j83" class="labelValue">s[' + j + ']='+ y + '</code>';
                  //  document.getElementById("mytable-title").style.display = "block";
                    if(j===0) {addRow('mytable');}
                    var removeValue = document.getElementById('j71');
                    document.getElementById('line7-value1').removeChild(removeValue);

                    removeValue = document.getElementById('j72');
                    document.getElementById('line7-value2').removeChild(removeValue);

                    removeValue = document.getElementById('j73');
                    document.getElementById('line7-value3').removeChild(removeValue);
                    
                    removeValue = document.getElementById('j74');
                    document.getElementById('line7-value4').removeChild(removeValue);
                    
                    var myTable = document.getElementById('mytable');
                    myTable.rows[myrow].cells[1].innerHTML = y;
                    myrow = parseInt(myrow)+1;
                    
                    j = parseInt(j)+1;
                    if (j < 10)
                    {
                        line = 6;

                    }

                } else if (line === 10)
                {

                    document.getElementById("line10").style.color = "red";
                    document.getElementById("line9").style.color = "black";

                    var removeValue = document.getElementById('j81');
                    document.getElementById('line8-value1').removeChild(removeValue);
                    removeValue = document.getElementById('j82');
                    document.getElementById('line8-value2').removeChild(removeValue);
                    removeValue = document.getElementById('j83');
                    document.getElementById('line8-value3').removeChild(removeValue);
                    j = 0;
                    
                } else if (line === 11)
                {
                    
                    document.getElementById("line11").style.color = "red";
                    if (j >= 1) {
                        document.getElementById("line13").style.color = "black";

                    var removeValue = document.getElementById('j121');
                    document.getElementById('line12-value1').removeChild(removeValue);
                    removeValue = document.getElementById('j122');
                    document.getElementById('line12-value2').removeChild(removeValue);
                    removeValue = document.getElementById('j123');
                    document.getElementById('line12-value3').removeChild(removeValue);
                    removeValue = document.getElementById('j124');
                    document.getElementById('line12-value4').removeChild(removeValue);
                    removeValue = document.getElementById('j125');
                    document.getElementById('line12-value5').removeChild(removeValue);
                    } else {
                        
                    
                    document.getElementById("line10").style.color = "black";
                    document.getElementById("line10-value1").innerHTML = '<code id="e10" class="labelValue">Element</code>';
                    document.getElementById("line10-value2").innerHTML = '<code id="v10" class="labelValue">Value</code>';
                    document.getElementById("line10-output").innerHTML = '<pre>\tElement\t\tValue\n</pre>';
                    //document.getElementById("line10-output").innerHTML = '<pre id="y103" class="labelValue">\tElement     Value\n\t      0\t\t2</pre>';
                    }
                } else if (line === 12)
                {

                    document.getElementById("line12").style.color = "red";
                    document.getElementById("line11").style.color = "black";
                    
                    document.getElementById("line11-value1").innerHTML = '<code id="j111" class="labelValue">' + j + '</code>';
                    document.getElementById("line11-value2").innerHTML = '<code id="j112" class="labelValue">' + j + '</code>';
                    document.getElementById("line11-value3").innerHTML = '<code id="j113" class="labelValue">10</code>';
                    document.getElementById("line11-value4").innerHTML = '<code id="j114" class="labelValue">' + j + '</code>';

                    if(j===0) {
                    var removeValue = document.getElementById('e10');
                    document.getElementById('line10-value1').removeChild(removeValue);
                    removeValue = document.getElementById('v10');
                    document.getElementById('line10-value2').removeChild(removeValue);
                    }

                } else if (line === 13)
                {
                    document.getElementById("line13").style.color = "red";
                    document.getElementById("line12").style.color = "black";
                   y = parseInt(j);
                    y = 2+ (2*y);
                    document.getElementById("line12-value1").innerHTML = '<code id="j121" class="labelValue">' + j + '</code>';
                    document.getElementById("line12-value2").innerHTML = '<code id="j122" class="labelValue">' + y + '</code>';
                    document.getElementById("line12-value3").innerHTML = '<code id="j123" class="labelValue">' + j + '</code>';
                    document.getElementById("line12-value4").innerHTML = '<code id="j124" class="labelValue">' + j + '</code>';
                    document.getElementById("line12-value5").innerHTML = '<code id="j125" class="labelValue">s[' + j + ']='+ y + '</code>';
                  //  document.getElementById("mytable-title").style.display = "block";
                   
                    var removeValue = document.getElementById('j111');
                    document.getElementById('line11-value1').removeChild(removeValue);

                    removeValue = document.getElementById('j112');
                    document.getElementById('line11-value2').removeChild(removeValue);

                    removeValue = document.getElementById('j113');
                    document.getElementById('line11-value3').removeChild(removeValue);
                    
                    removeValue = document.getElementById('j114');
                    document.getElementById('line11-value4').removeChild(removeValue);
                    
                    switch (j) {
                        case 0:
                            document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2</pre>';
                            break;
                        case 1:
                           document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4</pre>';
                            break;
                        case 2:
                           document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6</pre>';
                            break;
                        case 3:
                            document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8</pre>';
                            break;
                        case 4:
                            document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t    10</pre>';
                            break;
                        case 5:
                            document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t   10\n\t      5\t\t   12</pre>';
                            break;
                        case 6:
                            document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t   10\n\t      5\t\t   12\n\t      6\t\t   14</pre>';
                            break;
                        case 7:
                            document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t   10\n\t      5\t\t   12\n\t      6\t\t   14\n\t      7\t\t   16</pre>';
                            break;
                        case 8:
                          document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t   10\n\t      5\t\t   12\n\t      6\t\t   14\n\t      7\t\t   16\n\t      8\t\t   18</pre>';
                            break;
                        case 9:
                           document.getElementById("line12-output").innerHTML = '<pre id="y103" >\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t   10\n\t      5\t\t   12\n\t      6\t\t   14\n\t      7\t\t   16\n\t      8\t\t   18\n\t      9\t\t   20</pre>';
                            break;


                    }

                    j = parseInt(j)+1;
                    if (j < 10)
                    {
                        line = 10;

                    }



                } else if (line === 14)
                {
                    //var saveTotal = parseInt(total) ;
                    document.getElementById("line14").style.color = "red";
                    document.getElementById("line13").style.color = "black";

                    var removeValue = document.getElementById('j121');
                    document.getElementById('line12-value1').removeChild(removeValue);
                    removeValue = document.getElementById('j122');
                    document.getElementById('line12-value2').removeChild(removeValue);
                    removeValue = document.getElementById('j123');
                    document.getElementById('line12-value3').removeChild(removeValue);
                    removeValue = document.getElementById('j124');
                    document.getElementById('line12-value4').removeChild(removeValue);
                    removeValue = document.getElementById('j125');
                    document.getElementById('line12-value5').removeChild(removeValue);


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
                document.getElementById("line12-output").innerHTML = '<pre id="y103" >\tElement\t\tValue\n\t      0\t\t    2\n\t      1\t\t    4\n\t      2\t\t    6\n\t      3\t\t    8\n\t      4\t\t   10\n\t      5\t\t   12\n\t      6\t\t   14\n\t      7\t\t   16\n\t      8\t\t   18\n\t      9\t\t   20</pre>';
                 
            }
function refreshAlert() {
  
  if (confirm("Please refresh the page to start again!")) {
    window.location.reload();
  } 
 
}

        </script>

    </head>

    <body>
        <div class="container mainDiv">
            <div class="blog-post ">
                <!--1.1 CODES-->

                <code id="line1" class="lineFont" >#include  </code>
                <pre id="line2" class="lineFont">#define SIZE 10 <label id="line2-value"></label></pre>
                    <pre id="line3" class="lineFont">int main( void )</pre>
                <pre id="line4" class="lineFont" >{</pre>
                <pre id="line5" class="lineFont">int s[ SIZE<label id="line5-value1" ></label> ]; </pre>
                <pre id="line6" class="lineFont">int j<label id="line6-value" ></label> ;</pre>
                <pre id="line7" class="lineFont">for ( j<label id="line7-value1" ></label> = 0; j<label id="line7-value2" ></label> < SIZE<label id="line7-value3" ></label> ; j<label id="line7-value4" ></label>++ ) {</pre>
                <pre id="line8" class="lineFont">s[ j<label id="line8-value1" ></label> ] = 2 + 2 * j<label id="line8-value2" ></label>; <label id="line8-value3" ></label></pre>
                     <pre id="line9" class="lineFont">} </pre>
                <pre id="line10" class="lineFont">printf( "%s<label id="line10-value1" ></label> %13s<label id="line10-value2" ></label>\n", "Element", "Value" );</pre>
                <pre id="line11" class="lineFont">for ( j<label id="line11-value1" ></label> = 0; j<label id="line11-value2" ></label> < SIZE<label id="line11-value3" ></label> ; j<label id="line11-value4" ></label>++ ) {</pre>

                <pre id="line12" class="lineFont">printf( "%7d<label  id="line12-value1"></label> %13d<label  id="line12-value2"></label> \n ", j<label  id="line12-value3"></label>, s[ j<label  id="line12-value4"></label> ] ); <label  id="line12-value5"></label></pre>
                    <pre id="line13" class="lineFont">} </pre>
                <pre id="line14" class="lineFont">return 0;</pre>
                <pre id="line15" class="lineFont">}</pre>

            </div>

            <div class="other-posts">
                <div class="other" id="line5-value2">
                    
                </div>

                <div class="other">
                    <div class="buttonDiv"> <!--1.2 BUTTONS -->

                         <div class="col-md-3 buttonDiv"> <!--1.2 BUTTONS -->
                    <div class="row ">
                        <a class="button" target="target" href="loopDebugServlet?program_id=4" style="text-decoration:none;cursor:default;width:100%;padding:0 5px 0px 5px;border-color:gray; font-size:20px;"  >DEBUG</a>
                    </div>
                
                    <div class="row "> 
                        <button onclick="next()" class="button" style="margin-top:10px;margin-bottom:10px;" >NEXT</button>
                    </div>
                    <div class="row ">
                        <a class="button" target="target" href="runServlet?program_id=4" style="text-decoration:none;cursor:default;width:100%;padding:0 20px 0px 20px;border-color:gray; font-size:20px;"  >RUN</a>
                    </div>
                    <div class="row"> 
                        <button onClick="window.location.reload();" style="margin-top:10px;background-color: #6e87a7; color: black;" class="button" >Refresh</button>
                    </div>
                </div>

                    </div>
                </div>


            </div>

            <div class="clearfix"></div>

            <div class="author-box">
                <div class="row mainDiv" style="background-color: #102b5a;"><!--II.OUTPUT TITLE -->
                    <label class="col-md-12" style="color: white; font-size:20px; text-align: center;">OUTPUT</label>
                </div>
                <div class="row mainDiv" style="background-color: #6e87a7;"><!--III.OUTPUT COMPONENTS -->
                    <div id="line10-output" class="lineFont"></div>
                    <div id="line12-output" class="lineFont"></div>
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

