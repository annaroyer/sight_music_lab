require 'rails_helper'

describe Song do
  let(:exercise) { create(:exercise) }
  subject { Song.new(melody_analysis_notes, exercise) }

  context 'attributes' do
    it 'has beats_per_measure' do
      expect(subject.beats_per_measure).to eq(4)
    end
  end

  context 'instance methods' do
    describe '#notes' do
      it 'returns an array of note objects' do
        note = double('note')
        allow(Note).to receive(:new).and_return(note)

        expect(subject.notes).to eq([note, note, note, note, note, note])
      end
    end
  end

  context 'class methods' do
    describe '.from_upload' do
      it 'returns a song object from a url to an audio file' do
        url = "https://sight-music-lab.s3-us-west-1.amazonaws.com/attempts/audios/000/000/020/original/recorded.mp3"

        melody_result = File.open('./spec/fixtures/melody.json')

        stub_request(:post, "https://api.sonicapi.com/analyze/melody?access_id=#{ENV['SONIC_API_KEY']}&format=json&input_file=#{url}")
          .to_return(status: 200, body: melody_result, headers: {})


        song = Song.from_upload(url, exercise)

        expect(song.class).to eq(Song)
      end
    end
  end
end

def melody_analysis_notes
  [ {midi_pitch: "55.389259338378906", onset_time: "0.005328798185941043", duration: "0.3031065759637188", volume: "0.000553264981135726"},
    {midi_pitch: "58.07857131958008", onset_time: "1.154263038548753", duration: "0.44081632653061226", volume: "0.7653452157974243"},
    {midi_pitch: "61.89057922363281", onset_time: "1.6017913832199546", duration: "0.4591609977324263", volume: "0.5652092695236206"},
    {midi_pitch: "64.90135955810547", onset_time: "2.0637868480725623", duration: "0.4955328798185941", volume: "0.3952583968639374"},
    {midi_pitch: "61.90035629272461", onset_time: "2.562517006802721", duration: "0.5079818594104308", volume: "0.5193013548851013"},
    {midi_pitch: "57.98161315917969", onset_time: "3.07421768707483", duration: "0.7405442176870748", volume: "0.6150729656219482"}
  ]
end
