try {
  var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
  var recognitionNum = new SpeechRecognition();
  
}
catch(e) {
  console.error(e);
  $('.no-browser-support').show();
  $('.app').hide();
}


var songName = $('#locationName');
var noteContent = '';


/*-----------------------------
      Voice Recognition 
------------------------------*/

// If false, the recording will stop after a few seconds of silence.
// When true, the silence period is longer (about 15 seconds),
// allowing us to keep recording even when the user pauses. 
recognitionNum.continuous = true;

// This block is called every time the Speech APi captures a line. 
recognitionNum.onresult = function (event) {

  // event is a SpeechRecognitionEvent object.
  // It holds all the lines we have captured so far. 
  // We only need the current one.
  var current = event.resultIndex;

  // Get a transcript of what was said.
  var transcript = event.results[current][0].transcript;

  // Add the current transcript to the contents of our Note.
  // There is a weird bug on mobile, where everything is repeated twice.
  // There is no official solution so far so we have to handle an edge case.
  var mobileRepeatBug = (current == 1 && transcript == event.results[0][0].transcript);

  if (!mobileRepeatBug) {
      
    noteContent += transcript;
    songName.val(noteContent);
  }
};



$('#cap-location-btn').on('click', function (e) {
    if (noteContent.length) {
        noteContent = '';
    }
    songName.val('');
    recognitionNum.start();
    staerTimer(5, recognitionNum)
});



// Sync the text inside the text area with the noteContent variable.
songName.on('input', function () {
    noteContent = $(this).val();
})

function staerTimer(interval, recognitionNum) {
    // Set the date we're counting down to
    var countDownDate = new Date();
    countDownDate.setSeconds(countDownDate.getSeconds() + interval);

    // Update the count down every 1 second
    var x = setInterval(function () {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now an the count down date
        var distance = countDownDate - now;

        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Display the result in the element with id="demo"
        document.getElementById("demo").innerHTML = seconds + "s ";

        // If the count down is finished, write some text 
        if (distance < 0) {
            clearInterval(x);
            document.getElementById("demo").innerHTML = '';
            recognitionNum.stop();
        }
    }, 1000);
}