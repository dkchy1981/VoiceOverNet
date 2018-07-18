<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calc.aspx.cs" Inherits="TestProj1.Calc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>Hello World!</h1>
        <div class="row">
            <div class="col-sm-2">
                <p>Number 1</p>
            </div>
            <div class="col-sm-10">
                <input id="number1" value="0" />
                <button id="cap-first-btn" title="Capture First Number">Capture First Number</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <p>Number 2</p>
            </div>
            <div class="col-sm-10">
                <input id="number2" value="0" />
                <button id="cap-second-btn" title="Capture Second Number">Capture Second Number</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <p>Operator</p>
            </div>
            <div class="col-sm-10">
                <input id="Operator" value="0" />
                <button id="cap-operator-btn" title="Capture Operator">Capture Operator</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <p></p>
            </div>
            <div class="col-sm-10">
                <button id="calculate-btn" title="Calculate" onclick="Calculate()">Calculate</button>
                <input id="Result" value="0" />
            </div>
        </div>
    </div>
    <script src="jquery.min.js"></script>
    <script src="script_Calculate.js"></script>

</body>
</html>
