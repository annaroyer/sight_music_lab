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
//= require vexflow-min
//= require tabdiv-debug
//= require_tree .

$(document).ready(function(){
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
          var notes = data.song.notes.join(' ');
          var canvas = document.querySelectorAll('main > div:last-child > canvas');
          debugger
          exercises.lastElementChild.append('notes ' + notes + ' =||');
        }
      }));
    })
  });
