// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery_ujs
//= require_tree .

var recorder = document.getElementById('recorder');
var player = document.getElementById('player');

recorder.addEventListener('change', function(e) {
  var file = e.target.files[0];
  player.src = URL.createObjectURL(file);

  var formData = new FormData();
  formData.append('input_file', recorder.files[0]);
  formData.append

  fetch('https://api.sonicapi.com/analyze/melody?access_id=67a84cd6-5d82-4f3b-bf96-752496ab2670&format=json', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .catch(error => console.error('Error:', error))
  .then(response => console.log('Success:', response));
  debugger
});

var handleSuccess = function(stream) {
  if (window.URL) {
    player.src = window.URL.createObjectURL(stream);
  } else {
    player.src = stream;
  }
};

navigator.mediaDevices.getUserMedia({ audio: true, video: false })
.then(handleSuccess);

VF = Vex.Flow;

// Create an SVG renderer and attach it to the DIV element named "boo".
var div = document.getElementById("staff")
var renderer = new VF.Renderer(div, VF.Renderer.Backends.SVG);

// Configure the rendering context.
renderer.resize(500, 500);
var context = renderer.getContext();
context.setFont("Arial", 10, "").setBackgroundFillStyle("#eed");

// Create a stave of width 400 at position 10, 40 on the canvas.
var stave = new VF.Stave(10, 40, 400);

// Add a clef and time signature.
stave.addClef("treble").addTimeSignature("4/4");

// Connect it to the rendering context and draw!
stave.setContext(context).draw();

var notes = [
  new VF.StaveNote({clef: "treble", keys: ["a#/4"], duration: "q" }),
  new VF.StaveNote({clef: "treble", keys: ["d/5"], duration: "q" }),
  new VF.StaveNote({clef: "treble", keys: ["f/5"], duration: "q" }),
  new VF.StaveNote({clef: "treble", keys: ["d/5"], duration: "q" }),
];

// Create a voice in 4/4 and add above notes
var voice = new VF.Voice({num_beats: 4,  beat_value: 4});
voice.addTickables(notes);

// Format and justify the notes to 400 pixels.
var formatter = new VF.Formatter().joinVoices([voice]).format([voice], 400);

// Render voice
voice.draw(context, stave);
