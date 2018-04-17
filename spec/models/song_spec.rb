require 'rails_helper'

describe Song do
  subject { Song.new(melody_analysis) }

  context 'attributes' do
    it 'has a key' do
      expect(subject.key).to eq("A# Maj")
    end

    it 'has a tse' do
      expect(subject.tse).to eq('4/4')
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

    describe '#beats_per_measure' do
      it 'returns the number of beats per measure from the time signature' do
        expect(subject.beats_per_measure).to eq(4)
      end
    end
  end

  context 'class methods' do
    describe '.from_upload' do
      it 'returns a song object from a url to an audio file' do
        
      end
    end
  end
end

def melody_analysis
  {key: "A# Maj", key_index: "10", tuning_frequency: "439.9074401855469",
    notes: [
      {midi_pitch: "55.389259338378906", onset_time: "0.005328798185941043", duration: "0.3031065759637188", volume: "0.000553264981135726"},
      {midi_pitch: "58.07857131958008", onset_time: "1.154263038548753", duration: "0.44081632653061226", volume: "0.7653452157974243"},
      {midi_pitch: "61.89057922363281", onset_time: "1.6017913832199546", duration: "0.4591609977324263", volume: "0.5652092695236206"},
      {midi_pitch: "64.90135955810547", onset_time: "2.0637868480725623", duration: "0.4955328798185941", volume: "0.3952583968639374"},
      {midi_pitch: "61.90035629272461", onset_time: "2.562517006802721", duration: "0.5079818594104308", volume: "0.5193013548851013"},
      {midi_pitch: "57.98161315917969", onset_time: "3.07421768707483", duration: "0.7405442176870748", volume: "0.6150729656219482"}
    ]
  }
end
