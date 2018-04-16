var originalExercise = "M: 4/4\n" +
                       "L: 1/4\n" +
                       "K: A^ Maj\n" +
                       "A^1 |  D1 F1 D1 A^2||";
ABCJS.renderAbc("exercise-score", originalExercise);

const recorder = new MicRecorder({
  bitRate: 128
});

const player = $('#player');

$('#upload').on('change', function(e) {
  var file = e.target.files[0];
  getSheetMusic(file);
});

$('#start').on('click', startRecording);

function startRecording(){
  recorder.start().then(() => {
    $('#start').off();
    $('#stop').on('click', stopRecording);
  })
}

function stopRecording(){
  recorder.stop().getMp3().then(([buffer, blob]) => {
    var file = new File(buffer, 'input.mp3', {
      type: blob.type,
      lastModified: Date.now()
    });
    $('#stop').off();
    getSheetMusic(file);
  })
}

const getSheetMusic = function(file){
  player.src = URL.createObjectURL(file);
  var formData = new FormData();
  formData.append('attempt[audio]', file);

  fetch('/api/v1/attempts', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(function(response){
    const song = response.song;
    const newAttempt = `M: ${song.tse}\n` +
                       `L: ${song.each_beat}\n` +
                       `K: ${song.key}\n` +
                       `${song.notes.join(' ')}` + '||';
    const attemptScore = $('.exercises').append($('<div>', {class: 'paper', id: 'attempt-score'}));
    ABCJS.renderAbc('attempt-score', newAttempt);
  })
  .catch((error) => console.error('Error:', error))
}
