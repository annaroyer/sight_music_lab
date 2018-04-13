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
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .
//= require abcjs-rails

  var recorder = document.getElementById('recorder');
  var player = document.getElementById('player');

  recorder.addEventListener('change', function(e) {
    var file = e.target.files[0];
    player.src = URL.createObjectURL(file);

    var formData = new FormData();
    formData.append('input_file', recorder.files[0]);

    fetch('https://api.sonicapi.com/analyze/melody?access_id=67a84cd6-5d82-4f3b-bf96-752496ab2670&format=json', {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .catch(error => console.error('Error:', error))
    .then(response => $.ajax({
        method: 'POST',
        url: 'api/v1/attempts',
        data: response,
        success: function(data) {
          var song = data.song;
          var new_attempt = `M: ${song.tse}\n` +
                            `L: ${song.each_beat}\n` +
                            `K: ${song.key}\n` +
                            `${song.notes.join(' ')}` + '||';
          var attemptScore = $('.exercises').append($('<div>', {class: 'paper', id: 'attempt-score'}));
          ABCJS.renderAbc('attempt-score', new_attempt);
        }
      }));
    })

    var abc = "M: 4/4\n" +
              "L: 1/4\n" +
              "K: A^ Maj\n" +
              "A^1 |  D1 F1 D1 A^2||";
    ABCJS.renderAbc("exercise-score", abc);


navigator.mediaDevices.getUserMedia({ audio: true })
  .then(function(stream){
    var mediaRecorder = new MediaRecorder(stream);
    debugger
});

$('#start').on('click', function(){
  mediaRecorder.start();
});

var sound_buffers = [];
mediaRecorder.ondataavailable = function(e) {
  sound_buffers.push(e.data)
}

$('#stop').on('click', function(){
  mediaRecorder.stop();
});

mediaRecorder.onstop = function(e) {
  var blob = new Blob(sound_buffers, { 'type' : 'audio/ogg; codecs=opus' });
  sound_buffers = [];
}
