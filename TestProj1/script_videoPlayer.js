try {
  var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
  var recognitionNum = new SpeechRecognition();
  
}
catch(e) {
  console.error(e);
  $('.no-browser-support').show();
  $('.app').hide();
}


var songName = $('#songName');
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



$('#cap-song-btn').on('click', function (e) {
    if (noteContent.length) {
        noteContent = '';
    }
    songName.val('0');
    recognitionNum.start();
});



// Sync the text inside the text area with the noteContent variable.
songName.on('input', function () {
    noteContent = $(this).val();
})


