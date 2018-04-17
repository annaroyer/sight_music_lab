var originalExercise = "M: 4/4\n" +
                       "L: 1/4\n" +
                       "K: A^ Maj\n" +
                       "A^1 |  D1 F1 D1 A^2|]";
ABCJS.renderAbc("exercise-score", originalExercise);

const recorder = new MicRecorder({
  bitRate: 128
});

const player = $('#player');

const getSheetMusic = function(song, label){
  var newAttempt = `M: ${song.tse}\n` +
                   `L: ${song.each_beat}\n` +
                   `K: ${song.key}\n` +
                   `${song.notes.join(' ')}` + '|]';
  var attemptScore = $('.exercises').append($('<div>', {class: 'paper', id: label}));
  ABCJS.renderAbc(label, newAttempt);
}

const sendAttempt = function(file){
  player.src = URL.createObjectURL(file);
  let formData = new FormData();
  formData.append('attempt[audio]', file);

  fetch('/api/v1/attempts', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(response => getSheetMusic(response.song, 'attempt-song'))
  .catch((error) => console.error('Error:', error))
}

const stopRecording = function(){
  recorder.stop().getMp3().then(([buffer, blob]) => {
    let file = new File(buffer, 'input.mp3', {
      type: blob.type,
      lastModified: Date.now()
    });
    $('#stop').off();
    sendAttempt(file);
  })
}

const startRecording = function(){
  recorder.start().then(() => {
    $('#start').off();
    $('#stop').on('click', stopRecording);
  })
}

// const getRandomScore = function(){
//   fetch('/api/v1/exercises/song/random', {
//     method: 'GET'
//   })
//   .then(response => response.json())
//   .then(response => getSheetMusic(response.song))
//   .catch((error) => console.error('Error:', error))
// }

// $(document).ready(){
//   getRandomScore();
// }

$('#upload').on('change', function(e) {
  let file = e.target.files[0];
  sendAttempt(file);
});

$('#start').on('click', startRecording);
