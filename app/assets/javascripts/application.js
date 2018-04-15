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

  var player = document.getElementById('player');

  $('#recorder').on('change', function(e) {
    var file = e.target.files[0];
    getSheetMusic(file);
  });

    var originalExercise = "M: 4/4\n" +
                           "L: 1/4\n" +
                           "K: A^ Maj\n" +
                           "A^1 |  D1 F1 D1 A^2||";
    ABCJS.renderAbc("exercise-score", originalExercise);


navigator.mediaDevices.getUserMedia({ audio: true, video: false })
  .then(function(stream){
    var mediaRecorder = new MediaRecorder(stream);
    mediaRecorder.audioChannels = 1;
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
      const blob = new Blob(sound_buffers, { type: 'audio/wav' });
      var file = new File(sound_buffers, 'input.wav', { type: 'audio/wav' });
      sound_buffers = [];
      getSheetMusic(file);
    }
  });

  const getSheetMusic = function(file){
    player.src = URL.createObjectURL(file);
    var formData = new FormData();
    formData.append('audio', file);

    fetch('/api/v1/attempts', {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .then(function(response){
      var song = response.song;
      var newAttempt = `M: ${song.tse}\n` +
                        `L: ${song.each_beat}\n` +
                        `K: ${song.key}\n` +
                        `${song.notes.join(' ')}` + '||';
      var attemptScore = $('.exercises').append($('<div>', {class: 'paper', id: 'attempt-score'}));
      ABCJS.renderAbc('attempt-score', newAttempt);
    })
    .catch((error) => console.error('Error:', error))
  }
