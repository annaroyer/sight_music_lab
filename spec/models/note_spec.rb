require 'rails_helper'

describe Note do
  subject { Note.new({midi_pitch: "58.07857131958008",
                      onset_time: "1.154263038548753",
                      duration: "0.44081632653061226",
                      volume: "0.7653452157974243"}, 0.5)}

  context 'instance methods' do
    describe '#name' do
      it 'returns the letter note and abc octave format as a string' do
        expect(subject.letter).to eq('A^,')
      end

      it 'returns the note in a different abc octave format' do
        note = Note.new({midi_pitch: "84.07857131958008",
                         onset_time: "1.154263038548753",
                         duration: "0.44081632653061226",
                         volume: "0.7653452157974243"}, 0.5)

        expect(note.letter).to eq("c'")
      end
    end

    describe '#num_beats' do
      it 'returns the number of beats represented as a whole or rational number' do
        expect(subject.num_beats).to eq("1")
      end
    end
  end
end
