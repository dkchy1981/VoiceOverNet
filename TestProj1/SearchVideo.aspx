<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchVideo.aspx.cs" Inherits="TestProj1.SearchVideo" %>

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
        <h1>Search music and play</h1>
        <div class="row">
            <div class="col-sm-12">
                <input id="songName" value="" />
                <button id="cap-song-btn" title="Sepak Song">Sepak Song</button>
                <button id="play-btn" title="Play Video" onclick="playVideo()">Play Video</button>
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

    <script>
        function playVideo() {
            var songName = $("#songName").val();

            var dict = []; // create an empty array

            dict.push({
                key: "n2u81Ujc93g",
                value: "Dilbar"
            });

            dict.push({
                key: "yIIGQB6EMAM",
                value: "Bomb Diggy Diggy"
            });

            dict.push({
                key: "xmU0s2QtaEY",
                value: "Swag Se Swagat"
            });

            dict.push({
                key: "GaBEcipbuGE",
                value: "Badshah"
            });

            var songID = '0';

            $.each(dict, function (k, v) {
                if (matchRuleShort(v, songName)) {
                    songID = v.key;
                    
                }
            });

            if (songID == null || songID == '' || songID == 'false' || songID == '0') {
                alert('Please search again.');
                return;
            }
            window.location.href = 'YouTubePlayer.aspx?id=' + songID;
        }




        //Short code
        function matchRuleShort(str, rule) {
            var searchString = str.value.toUpperCase().trim()
            rule = "*" + rule.toUpperCase().trim() + "*";
            var ret1 = new RegExp("^" + rule.split("*").join(".*") + "$").test(searchString);
            return ret1;
        }





    </script>

    <script src="jquery.min.js"></script>
    <script src="script_videoPlayer.js"></script>


</body>
</html>
