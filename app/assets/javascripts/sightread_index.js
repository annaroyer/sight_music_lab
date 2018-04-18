const exercise = $('.paper').first();
const exerciseId = exercise.attr('id');
const userEmail = $('.navbar').attr('id');
const player = $('#player');

const recorder = new MicRecorder(
  {bitRate: 128}
);

const showScore = function(pitchScore, rhythmScore){
  $('.star-scores').append($(`<p class='stars-heading'>Pitch Score: ${pitchScore} out of 5</p>`));
  $('.star-scores').append($(`<p class='stars-heading'>Rhythm Score: ${rhythmScore} out of 5</p>`));
}

const getSheetMusic = function(song, label){
  $('#loader-gif').hide();
  var newAttempt = `M: ${song.tse}\n` +
                   `L: ${song.each_beat}\n` +
                   `K: ${song.key}\n` +
                   `${song.notes.join(' ')}` + '|]';
  var attemptScore = $('.music').append($('<div>', {class: 'paper', id: label}));
  ABCJS.renderAbc(label, newAttempt);
}

const sendAttempt = function(file){
  player.src = URL.createObjectURL(file);
  $('#loader-gif').show();
  let formData = new FormData();
  formData.append('audio', file);
  formData.append('user_email', userEmail);

  fetch(`/api/v1/exercises/${exerciseId}/attempts`, {
    method: 'POST',
    body: formData
  })
  .then((response) => response.json())
  .then(function(response){
    getSheetMusic(response.song, 'attempt-song');
    showScore(response.pitch_score, response.rhythm_score);
  })
  .catch((error) => console.error('Error:', error))
}

const stopRecording = function(){
  recorder.stop().getMp3().then(([buffer, blob]) => {
    let file = new File(buffer, 'input.mp3', {
      type: blob.type,
      lastModified: Date.now()
    })
    sendAttempt(file);
  })
}

const startRecording = function(){
  recorder.start().then(() => {
    $('.stop').on('click', function(){
      $(this).hide();
      $('.start').show();
      stopRecording();
    });
  })
}

$(document).ready(function(){
  ABCJS.renderAbc(exerciseId, exercise.html());
  $('.stop').hide();
})

$('#upload').on('change', function(e) {
  let file = e.target.files[0];
  let fileName = e.target.value.split('\\').pop();
  if(fileName) {
    $('label').html(fileName);
  }
  sendAttempt(file);
});

$('.start').on('click', function(){
  $(this).hide();
  $('.stop').show();
  startRecording();
});
