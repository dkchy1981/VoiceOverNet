<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchVideoFromYoutube.aspx.cs" Inherits="TestProj1.SearchVideo" %>

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

        function getIndicesOf(searchStr, str, caseSensitive) {
            var searchStrLen = searchStr.length;
            if (searchStrLen == 0) {
                return [];
            }
            var startIndex = 0, index, indices = [];
            if (!caseSensitive) {
                str = str.toLowerCase();
                searchStr = searchStr.toLowerCase();
            }
            while ((index = str.indexOf(searchStr, startIndex)) > -1) {
                indices.push(index);
                startIndex = index + searchStrLen;
            }
            return indices;
        }

        function playVideo() {
            var songName = $("#songName").val();
            var songID = '';

            $.ajax({
                url: 'https://www.youtube.com/results?search_query=' + songName,
                headers: {
                    'Content-Type': 'text/html',
                    'Access-Control-Allow-Origin': '*'
                },
                type: "GET", /* or type:"GET" or type:"PUT" */
                success: function (result) {

                    var indices = getIndicesOf("watch?v=", result);

                    $.each(indices, function (index, val) {
                        var innerString = result.substring(val + 8, val + 30);
                        var i = getIndicesOf("\"", innerString)[0];
                        //console.log(innerString);
                        //console.log(i);
                        //console.log(innerString.substring(0, i));
                        if(songID=='')
                        {
                            songID = innerString.substring(0, i);
                            console.log(songID);
                        }
                    });

                    if (songID == null || songID == '' || songID == 'false' || songID == '0') {
                        alert('Please search again.');
                        return;
                    }

                    window.location.href = 'YouTubePlayer.aspx?id=' + songID;
                },
                error: function () {
                    console.log("error");
                }
            });

            
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
