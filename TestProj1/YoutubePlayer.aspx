<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <div id="player"></div>

    <script>
        // 2. This code loads the IFrame Player API code asynchronously.
        var tag = document.createElement('script');
        tag.id = 'iframe-demo';

        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // 3. This function creates an <iframe> (and YouTube player)
        //    after the API code downloads.
        var player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '390',
                width: '640',
                videoId: getUrlVars()["id"],
                playerVars: { 'autoplay': 1, 'controls': 0 },
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange,

                }
            });
        }
        function onPlayerReady(event) {
            document.getElementById('existing-iframe-example').style.borderColor = '#FF6D00';
        }
        function changeBorderColor(playerStatus) {
            var color;
            if (playerStatus == -1) {
                color = "#37474F"; // unstarted = gray
            } else if (playerStatus == 0) {
                color = "#FFFF00"; // ended = yellow
            } else if (playerStatus == 1) {
                color = "#33691E"; // playing = green
            } else if (playerStatus == 2) {
                color = "#DD2C00"; // paused = red
            } else if (playerStatus == 3) {
                color = "#AA00FF"; // buffering = purple
            } else if (playerStatus == 5) {
                color = "#FF6DOO"; // video cued = orange
            }
            if (color) {
                document.getElementById('existing-iframe-example').style.borderColor = color;
            }
        }
        function onPlayerStateChange(event) {
            changeBorderColor(event.data);
        }

        // Read a page's GET URL variables and return them as an associative array.
        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }

        
    </script>    
</body>
</html>
