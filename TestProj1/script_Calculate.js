try {
  var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
  var recognitionNum1 = new SpeechRecognition();
  var recognitionNum2 = new SpeechRecognition();
  var recognitionOperator = new SpeechRecognition();  
}
catch(e) {
  console.error(e);
  $('.no-browser-support').show();
  $('.app').hide();
}


var number1 = $('#number1');
var number2 = $('#number2');
var Operator = $('#Operator');
var Result = $('#Result');

var noteContent = '';


/*-----------------------------
      Voice Recognition 
------------------------------*/

// If false, the recording will stop after a few seconds of silence.
// When true, the silence period is longer (about 15 seconds),
// allowing us to keep recording even when the user pauses. 
recognitionNum1.continuous = true;
recognitionNum2.continuous = true;
recognitionOperator.continuous = true;

// This block is called every time the Speech APi captures a line. 
recognitionNum1.onresult = function (event) {

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
    number1.val(noteContent);
  }
};

// This block is called every time the Speech APi captures a line. 
recognitionNum2.onresult = function (event) {

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
        number2.val(noteContent);
    }
};

// This block is called every time the Speech APi captures a line. 
recognitionOperator.onresult = function (event) {

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
        Operator.val(noteContent);
    }
};


$('#cap-first-btn').on('click', function (e) {
    if (noteContent.length) {
        noteContent = '';
    }
    number1.val('0');
    recognitionNum1.start();
});

$('#cap-second-btn').on('click', function (e) {
    if (noteContent.length) {
        noteContent = '';
    }
    number2.val('0');
    recognitionNum2.start();
});

$('#cap-operator-btn').on('click', function (e) {
    if (noteContent.length) {
        noteContent = '';
    }
    Operator.val('0');
    recognitionOperator.start();
});


// Sync the text inside the text area with the noteContent variable.
number1.on('input', function () {
    noteContent = $(this).val();
})

number2.on('input', function () {
    noteContent = $(this).val();
})

// Sync the text inside the text area with the noteContent variable.
Operator.on('input', function () {
    noteContent = $(this).val();
})

function Calculate()
{
    if (number1.val().trim() == '' || !checkForNumeric(number1.val().trim()))
    {
        alert('Please enter valid numeric data for number 1')        
    }

    else if (number2.val().trim() == '' || !checkForNumeric(number2.val().trim())) {
        alert('Please enter valid numeric data for number 2')
    }

    else if (Operator.val().trim() == '' || Operator.val().trim() == '0' || !checkForValidOperator(Operator.val())) {
        alert('Please enter valid Operator')
    }
    else {
        var n1 = parseFloat(number1.val().trim());
        var n2 = parseFloat(number2.val().trim());


        switch (Operator.val().toUpperCase().trim()) {
            case 'ADD':
                {
                    Result.val(n1 + n2)
                }
                break;
            case 'SUBTRACT':
                {
                    Result.val(n1 - n2)
                }
                break;
            case 'MULTIPLY':
                {
                    Result.val(n1 * n2)
                }
                break;
            case 'DIVIDE':
                {
                    Result.val(n1 / n2)
                }
                break;
            default:

        }
    }
}

function checkForValidOperator(operator) {
    var arr = ['ADD', 'SUBTRACT', 'MULTIPLY', 'DIVIDE'];
    if (arr.indexOf(operator.trim()>-1)) {
        return true
    }
    else {
        return false;
    }
}

function checkForNumeric(inputVal)
{
    var numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;
    if (!numericReg.test(inputVal)) {
        return false
    }
    else
    {
        return true;
    }
}


