<%-- 
    Document   : Pointer
    Created on : Feb 13, 2022, 7:06:49 PM
    Author     : theth
--%>

<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
        <title>Pointer</title>

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
            var x = Math.floor((Math.random() * 1000000) + 100000);
            var j = 0;
            var myrow = 3;
            var rowPtr = 1;
            var status = 0;


//            function addColumn(tableID) {
//                // Get a reference to the table
//                let tableRef = document.getElementById(tableID);
//
//                // Insert a row at the end of the table
//                let newRow = tableRef.insertColumn(2);
//
//                // Insert a cell in the row at index 0
//                let newCell = newRow.insertCell(0);
//
//                // Append a text node to the cell<td>s[j]</td><td>2+ 2*j</td>
//
//                let newText = document.createTextNode('s[ j ]');
//                newCell.appendChild(newText);
//
//                // let newRow1 = tableRef.insertRow(0);
//
//                // Insert a cell in the row at index 0
//                let newCell1 = newRow.insertCell(1);
//
//                // Append a text node to the cell<td>s[j]</td><td>2+ 2*j</td>
//
//                let newText1 = document.createTextNode('2+ 2*j');
//                newCell1.appendChild(newText1);
//            }
            function debug()
            {
                if (status != 0) {
                    refreshAlert();
                    return false;
                }
                status = 1;

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


                } else if (line === 4)
                {
                    document.getElementById("line4").style.color = "red";
                    document.getElementById("line3").style.color = "black";
                    document.getElementById("line3-value").innerHTML = '<code id="undefined3" class="labelValue">undefined</code>';

                } else if (line === 5)
                {
                    document.getElementById("line5").style.color = "red";
                    document.getElementById("line4").style.color = "black";
                    var removeValue = document.getElementById('undefined3');
                    document.getElementById('line3-value').removeChild(removeValue);

                } else if (line === 6)
                {
                    document.getElementById("line6").style.color = "red";
                    document.getElementById("line5").style.color = "black";

                } else if (line === 7)
                {
                    document.getElementById("line7").style.color = "red";
                    document.getElementById("line6").style.color = "black";
                    document.getElementById("line6-value").innerHTML = `
                    <table id="mytable" >
                       
                        <tr>
                            <td>name[0]</td>
                            <td>C</td>
                        </tr>
                        <tr>
                            <td>name[1]</td>
                            <td>  </td>
                        </tr>
                        <tr>
                            <td>name[2]</td>
                            <td>P</td>
                        </tr>
                        <tr>
                            <td>name[3]</td>
                            <td>r</td>
                        </tr>
                        <tr>
                            <td>name[4]</td>
                            <td>o</td>
                        </tr>
                        <tr>
                            <td>name[5]</td>
                            <td>g</td>
                        </tr>
                        <tr>
                            <td>name[6]</td>
                            <td>r</td>
                        </tr>
                        <tr>
                            <td>name[7]</td>
                            <td>a</td>
                        </tr>
                        <tr>
                            <td>name[8]</td>
                            <td>m</td>
                        </tr>
                        <tr>
                            <td>name[9]</td>
                            <td>"\\0"</td>
                        </tr>
                    </table>`;


                } else if (line === 8)
                {

                    document.getElementById("line8").style.color = "red";
                    document.getElementById("line7").style.color = "black";
                    document.getElementById("line7-value1").innerHTML = '<code id="C71" class="labelValue">C Program</code>';
                    document.getElementById("line7-value2").innerHTML = '<code id="C72" class="labelValue">C Program</code>';
                    document.getElementById("line7-output").innerHTML = '<code id="C73" >The string before conversion is: C Program</code>';

                } else if (line === 9)
                {

                    document.getElementById("line9").style.color = "red";
                    document.getElementById("line8").style.color = "black";
                    document.getElementById("line8-value").innerHTML = '<code id="C8" class="labelValue">C Program</code>';

                    var removeValue = document.getElementById('C71');
                    document.getElementById('line7-value1').removeChild(removeValue);

                    removeValue = document.getElementById('C72');
                    document.getElementById('line7-value2').removeChild(removeValue);

                } else if (line === 10)
                {

                    document.getElementById("line10").style.color = "red";
                    document.getElementById("line9").style.color = "black";
                    
                    document.getElementById("line9-value").innerHTML = '<code id="j9" class="labelValue">' + x + '</code>';

                    var removeValue = document.getElementById('C8');
                    document.getElementById('line8-value').removeChild(removeValue);
                    
                    var myTable = document.getElementById('mytable');
                    myTable.rows[0].insertCell(2).innerHTML = "sPtr=" + x;
                    

                } else if (line === 11)
                {

                    document.getElementById("line11").style.color = "red";

                    if (j >= 1) {

                        document.getElementById("line16").style.color = "black";

                        var removeValue = document.getElementById('C15');
                        document.getElementById('line15-value').removeChild(removeValue);
                    } else {
                        document.getElementById("line10").style.color = "black";

                        var removeValue = document.getElementById('j9');
                        document.getElementById('line9-value').removeChild(removeValue);

                    }
                    if (j == 9) {
                        line = 15;
                    }

                } else if (line === 12)
                {

                    document.getElementById("line12").style.color = "red";
                    document.getElementById("line11").style.color = "black";
                    switch (j) {
                        case 0:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">C</code>';
                            break;
                        case 1:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue"></code>';
                            break;
                        case 2:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">P</code>';
                            break;
                        case 3:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">r</code>';
                            break;
                        case 4:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">o</code>';
                            break;
                        case 5:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">g</code>';
                            break;
                        case 6:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">r</code>';
                            break;
                        case 7:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">a</code>';
                            break;
                        case 8:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">m</code>';
                            break;
                        case 9:
                            document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">"\\0"</code>';
                            break;


                    }
                    if (j < 3) {
                        line = 13;
                    }



                } else if (line === 13)
                {
                    document.getElementById("line13").style.color = "red";

                    document.getElementById("line12").style.color = "black";


                    var removeValue = document.getElementById('C11');
                    document.getElementById('line11-value').removeChild(removeValue);



                    switch (j) {
                        case 0:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">C</code>';
                            break;
                        case 1:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue"></code>';
                            break;
                        case 2:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">P</code>';
                            break;
                        case 3:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">r</code>';
                            break;
                        case 4:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">o</code>';
                            break;
                        case 5:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">g</code>';
                            break;
                        case 6:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">r</code>';
                            break;
                        case 7:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">a</code>';
                            break;
                        case 8:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">m</code>';
                            break;
                        case 9:
                            document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">"\\0"</code>';
                            break;


                    }


                } else if (line === 14)
                {

                    document.getElementById("line14").style.color = "red";
                    document.getElementById("line13").style.color = "black";

                    if (j < 3) {
                        document.getElementById("line12").style.color = "black";


                        var removeValue = document.getElementById('C11');
                        document.getElementById('line11-value').removeChild(removeValue);



                        switch (j) {
                            case 0:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">C</code>';
                                break;
                            case 1:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue"></code>';
                                break;
                            case 2:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">P</code>';
                                break;
                            case 3:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">r</code>';
                                break;
                            case 4:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">o</code>';
                                break;
                            case 5:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">g</code>';
                                break;
                            case 6:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">r</code>';
                                break;
                            case 7:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">a</code>';
                                break;
                            case 8:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">m</code>';
                                break;
                            case 9:
                                document.getElementById("line12-value").innerHTML = '<code id="C12" class="labelValue">"\\0"</code>';
                                break;


                        }
                    } else {
                        var removeValue = document.getElementById('C12');
                        document.getElementById('line12-value').removeChild(removeValue);
                        
                        var myTable = document.getElementById('mytable');
                      
                       

                        switch (j) {
                            case 0:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">C</code>';
                                break;
                            case 1:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue"></code>';
                                break;
                            case 2:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">P</code>';
                                break;
                            case 3:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">R</code>';
                                myTable.rows[myrow].cells[1].innerHTML = 'R';
                                break;
                            case 4:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">O</code>';
                                myTable.rows[myrow].cells[1].innerHTML = 'O';
                                break;
                            case 5:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">G</code>';
                                myTable.rows[myrow].cells[1].innerHTML = 'G';
                                break;
                            case 6:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">R</code>';
                                myTable.rows[myrow].cells[1].innerHTML = 'R';
                                break;
                            case 7:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">A</code>';
                                myTable.rows[myrow].cells[1].innerHTML = 'A';
                                break;
                            case 8:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">M</code>';
                                myTable.rows[myrow].cells[1].innerHTML = 'M';
                                break;
                            case 9:
                                document.getElementById("line13-value1").innerHTML = '<code id="C131" class="labelValue">"\\0"</code>';
                                break;


                        }
                         myrow = parseInt(myrow)+1;
                         
                        switch (j) {
                            case 0:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">C</code>';
                                break;
                            case 1:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue"></code>';
                                break;
                            case 2:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">P</code>';
                                break;
                            case 3:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">r</code>';
                                break;
                            case 4:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">o</code>';
                                break;
                            case 5:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">g</code>';
                                break;
                            case 6:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">r</code>';
                                break;
                            case 7:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">a</code>';
                                break;
                            case 8:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">m</code>';
                                break;
                            case 9:
                                document.getElementById("line13-value2").innerHTML = '<code id="C132" class="labelValue">"\\0"</code>';
                                break;


                        }
                    }


                } else if (line === 15)
                {
                    document.getElementById("line15").style.color = "red";
                    document.getElementById("line14").style.color = "black";
                    if (j < 3) {
                        var removeValue = document.getElementById('C12');
                        document.getElementById('line12-value').removeChild(removeValue);
                    } else {
                        var removeValue = document.getElementById('C131');
                        document.getElementById('line13-value1').removeChild(removeValue);
                        removeValue = document.getElementById('C132');
                        document.getElementById('line13-value2').removeChild(removeValue);
                    }

                } else if (line === 16)
                {
                    document.getElementById("line16").style.color = "red";
                    
                    if (j == 9) {
                        document.getElementById("line11").style.color = "black";
                        document.getElementById("line11-value").innerHTML = '<code id="C11" class="labelValue">"\\0"</code>';
                    } else {
                        document.getElementById("line15").style.color = "black";
                        x++;
                        document.getElementById("line15-value").innerHTML = '<code id="C15" class="labelValue">' + x + '</code>';
                        
                        let myTable = document.getElementById('mytable');
                        myTable.rows[rowPtr-1].deleteCell(2);
                        myTable.rows[rowPtr].insertCell(2).innerHTML = "sPtr=" + x;
                        rowPtr = parseInt(rowPtr)+1;
                    }

                    j = parseInt(j) + 1;
                    if (j < 10)
                    {
                        line = 10;

                    }

                } else if (line === 17)
                {
                    document.getElementById("line17").style.color = "red";
                    document.getElementById("line16").style.color = "black";
                    var removeValue = document.getElementById('C11');
                    document.getElementById('line11-value').removeChild(removeValue);

                    //var removeValue = document.getElementById('C15');
                    //document.getElementById('line15-value').removeChild(removeValue);
                } else if (line === 18)
                {
                    document.getElementById("line8").style.color = "red";
                    document.getElementById("line17").style.color = "black";
                } else if (line === 19)
                {
                    document.getElementById("line19").style.color = "red";
                    document.getElementById("line8").style.color = "black";
                    document.getElementById("line8-value").innerHTML = '<code id="C8" class="labelValue">C PROGRAM</code>';

                } else if (line === 20)
                {
                    document.getElementById("line20").style.color = "red";
                    document.getElementById("line19").style.color = "black";

                    var removeValue = document.getElementById('C8');
                    document.getElementById('line8-value').removeChild(removeValue);

                    document.getElementById("line19-value1").innerHTML = '<code id="C191" class="labelValue">C PROGRAM</code>';
                    document.getElementById("line19-value2").innerHTML = '<code id="C192" class="labelValue">C PROGRAM</code>';
                    document.getElementById("line19-output").innerHTML = '<code id="C192">The string after conversion is: C PROGRAM</code>';

                } else if (line === 21)
                {
                    document.getElementById("line21").style.color = "red";
                    document.getElementById("line20").style.color = "black";

                    var removeValue = document.getElementById('C191');
                    document.getElementById('line19-value1').removeChild(removeValue);
                    removeValue = document.getElementById('C192');
                    document.getElementById('line19-value2').removeChild(removeValue);

                } else if (line === 22)
                {
                    document.getElementById("line21").style.color = "black";


                }
                line++;
            }

            function run()
            {
                if (status != 0) {
                    refreshAlert();
                    return false;
                }
                status = 2;
                document.getElementById("line7-output").innerHTML = '<code id="C73" >The string before conversion is: C Program</code>';
                document.getElementById("line19-output").innerHTML = '<code id="C192">The string after conversion is: C PROGRAM</code>';
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

                <code id="line1" class="lineFont" >#include(stdio.h)</code>
                <pre id="line2" class="lineFont">#include(ctype.h)</pre>
                <pre id="line3" class="lineFont">void convertToUppercase(char *sPtr<label id="line3-value" ></label> );</pre>
                <pre id="line4" class="lineFont" >int main( void )</pre>
                <pre id="line5" class="lineFont">{</pre>
                <pre id="line6" class="lineFont">char name[] = "C Program";</pre>
                <pre id="line7" class="lineFont">printf( "The string before conversion is: %s<label id="line7-value1" ></label>", name<label id="line7-value2"></label> );</pre>
                <pre id="line8" class="lineFont">convertToUppercase( name<label id="line8-value" ></label> );</pre>

                <pre id="line19" class="lineFont">printf( "\nThe string after conversion is: %s<label id="line19-value1" ></label> \n", name<label id="line19-value2" ></label> );</pre>
                <pre id="line20" class="lineFont">return 0; </pre>
                <pre id="line21" class="lineFont">}</pre>
                <pre></pre>
                <pre id="line9" class="lineFont">void convertToUppercase(char *sPtr<label id="line9-value" ></label> )</pre>
                <pre id="line10" class="lineFont">{ </pre>
                <pre id="line11" class="lineFont">while (*sPtr<label id="line11-value" ></label> != '\0' ) {</pre>
                <pre id="line12" class="lineFont">if (islower( *sPtr<label id="line12-value" ></label> ) { </pre>
                <pre id="line13" class="lineFont">*sPtr<label id="line13-value1" ></label> = toupper( *sPtr<label id="line13-value2" ></label> ); </pre>
                <pre id="line14" class="lineFont">}</pre>
                <pre id="line15" class="lineFont">++sPtr<label id="line15-value" ></label> ;</pre>
                <pre id="line16" class="lineFont">}</pre>
                <pre id="line17" class="lineFont">}</pre>

            </div>

            <div class="other-posts">
                <div class="other" id="line6-value">

                </div>

                <div class="other">
                    <div class="buttonDiv"> <!--1.2 BUTTONS -->

                        <div class="col-md-3 buttonDiv"> <!--1.2 BUTTONS -->
                            <div class="row ">
                                <a class="button" target="target" href="loopDebugServlet?program_id=5" style="text-decoration:none;cursor:default;width:100%;padding:0 5px 0px 5px;border-color:gray; font-size:20px;"  >DEBUG</a>
                            </div>

                            <div class="row "> 
                                <button onclick="next()" class="button" style="margin-top:10px;margin-bottom:10px;" >NEXT</button>
                            </div>
                            <div class="row ">
                                <a class="button" target="target" href="runServlet?program_id=5" style="text-decoration:none;cursor:default;width:100%;padding:0 20px 0px 20px;border-color:gray; font-size:20px;"  >RUN</a>
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
                    <div id="line7-output" class="lineFont"></div>
                    <div id="line19-output" class="lineFont"></div>
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



