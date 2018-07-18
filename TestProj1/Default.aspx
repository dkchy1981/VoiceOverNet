<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestProj1.Default" Async="true"  %>

<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Voice Controlled Notes App</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">      
        
        

    </head>
    <body>        
        <div>

            <div> 
                <h3>Add New Note</h3>
                <div class="input-single">
                    <textarea id="notetextarea" runat="server" placeholder="Create a new note by typing or using voice recognition." rows="6"></textarea>
                </div>         
                <button id="start-record-btn" title="Start Recording">Start Recognition</button>
                <button id="start-listen-btn1" title="Listen" onclick="readOutLoud('notetextarea')">Listen</button>

                <div class="input-single">
                    <textarea id="notetextarea2" runat="server" placeholder="Create a new note by typing or using voice recognition." rows="6"></textarea>
                </div>         
                <button id="start-record-btn2" title="Start Recording">Start Recognition</button>
                <button id="start-listen-btn2" title="Listen" onclick="readOutLoud('notetextarea2')">Listen</button>
                
            </div>            

        </div>

        <script src="jquery.min.js"></script>
        <script src="script.js"></script>


    </body>


