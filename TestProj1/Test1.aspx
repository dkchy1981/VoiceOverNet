<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test1.aspx.cs" Inherits="TestProj1.Test1" Async="true" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <input type="button" onclick="CreateBug()" value="Create Bug" />
    <script src="jquery.min.js"></script>

    <script>

        function CreateBug() {

            var dataValue = "{ name: 'person', isGoing: 'true', returnAddress: 'returnEmail' }";

            $.ajax({
                type: "POST",
                url: "Test1.aspx/Process",
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



        //var id = $('a.ytd-thumbnail');
        ////console.log(id);

        //function getIndicesOf(searchStr, str, caseSensitive) {
        //    var searchStrLen = searchStr.length;
        //    if (searchStrLen == 0) {
        //        return [];
        //    }
        //    var startIndex = 0, index, indices = [];
        //    if (!caseSensitive) {
        //        str = str.toLowerCase();
        //        searchStr = searchStr.toLowerCase();
        //    }
        //    while ((index = str.indexOf(searchStr, startIndex)) > -1) {
        //        indices.push(index);
        //        startIndex = index + searchStrLen;
        //    }
        //    return indices;
        //}

        //$.ajax({
        //    url: 'https://www.youtube.com/results?search_query=songs',
        //    headers: {
        //        'Content-Type': 'text/html',
        //        'Access-Control-Allow-Origin': '*'
        //    },
        //    type: "GET", /* or type:"GET" or type:"PUT" */
        //    success: function (result) {

        //        var indices = getIndicesOf("watch?v=", result);

        //        $.each(indices, function (index, val) {
        //            var innerString = result.substring(val + 8, val + 30);
        //            var i = getIndicesOf("\"", innerString)[0];
        //            //console.log(innerString);
        //            //console.log(i);
        //            //console.log(innerString.substring(0, i));
        //        });



        //        console.log(indices);
                
        //    },
        //    error: function () {
        //        //console.log("error");
        //    }
        //});

        //$.each(id, function (index, val) {
        //    var url = val.href;
        //    var index1 = url.indexOf('?v=')
        //    var id = url.substring(index1 + 3);
        //    //console.log(index, index1, id, val.href)
        //});

    </script>


</body>


</html>
