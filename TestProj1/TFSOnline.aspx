<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TFSOnline.aspx.cs" Inherits="TestProj1.TFSOnline"  Async="true"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
     <div class="container">
        <h1>Create Bug in TFS</h1>
        <div class="row">
            <div class="col-sm-12">
                <input id="BugTitle" value="" style="width:500px" />
                <button id="cap-bugtitle-btn" title="Sepak Song">Speak Bug Title</button>
                <button id="createBug-btn" title="Play Video" onclick="CreateBug()">Create Bug</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                &nbsp;
              </div>
        </div>
        <div class="row">
            <div class="col-sm-12"><p style="font-size:10px;">
                Note*: Programe is configured for pre defined play list. Please speak 'Bomb', 'Diggy','Swag','Dilbar' & 'Badshah' to listen respective song.
                </p>
              </div>
        </div>
    </div>
     <script src="jquery.min.js"></script>
    <script src="script_OnlineTFS.js"></script>

    <script>

        function CreateBug() {

            var BugTitle = $("#BugTitle").val();
            var dataValue = '{ Title:"' + BugTitle + '" }';

            $.ajax({
                type: "POST",
                url: "TFSOnline.aspx/Process",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                },
                success: function (result) {
                    alert("We returned: " + result.d);
                }
            });
        }



    </script>
</body>
</html>
