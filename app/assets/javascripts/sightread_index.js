const exercise = $('.sheet-music').first()
const exerciseId = exercise.attr('id')
const userEmail = $('.navbar').attr('id')
const player = $('#player')

const recorder = new MicRecorder({bitRate: 128})

const showScore = function(pitchScore, rhythmScore){
  $('.star-scores').append($(`<p class='stars-heading'>Pitch Score: ${pitchScore} out of 5</p>`))
  $('.star-scores').append($(`<p class='stars-heading'>Rhythm Score: ${rhythmScore} out of 5</p>`))
}

const getSheetMusic = (song, label) => {
  $('#loader-gif').hide()
  const newAttempt = `M: ${song.tse}\n` +
                   `L: ${song.each_beat}\n` +
                   `K: ${song.key}\n` +
                   `${song.notes.join(' ')}` + '|]'
  $('.attempt').show().prepend($('<div>', {class: 'sheet-music', id: label}))
  ABCJS.renderAbc(label, newAttempt)
}


const sendAttempt = (file) => {
  $('.controls').first().hide()
  $('#loader-gif').show()
  let recording = URL.createObjectURL(file)
  $('#mp3_src').attr('src', recording)
  player[0].pause()
  player[0].load()
  let formData = new FormData()
  formData.append('audio', file)
  formData.append('user_email', userEmail)

  fetch(`/api/v1/exercises/${exerciseId}/attempts`, {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(response => {
    getSheetMusic(response.song, 'attempt-song')
    showScore(response.pitch_score, response.rhythm_score)
  })
  .catch((error) => console.error('Error:', error))
}

const stopRecording = () => {
  recorder.stop().getMp3().then(([buffer, blob]) => {
    let file = new File(buffer, 'input.mp3', {
      type: blob.type,
      lastModified: Date.now()
    })
    sendAttempt(file)
  })
}

const startRecording = () => {
  $('.start').hide()
  $('.stop').show()
  recorder.start().then(() => {
    $('.stop').click(() => stopRecording())
  })
}

$(document).ready(() => {
  ABCJS.renderAbc(exerciseId, exercise.html())
  $('.attempt').hide()
  $('.start').show()
  $('.stop').hide()
})

$('#upload').change(event => {
  let file = event.target.files[0]
  sendAttempt(file)
});

$('.start').click(() => startRecording());
