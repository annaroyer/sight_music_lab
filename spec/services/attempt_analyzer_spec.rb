require 'rails_helper'

describe AttemptAnalyzer do
  context 'instance methods' do
    describe '#generate' do
      it 'returns an active record attempt object given params' do
        VCR.use_cassette('analyzer') do
          user_email = create(:user).email
          exercise_id = create(:exercise).id
          audio = double('audio')

          upload = spy('upload')
          allow(Upload).to receive(:create).and_return(upload)

          song = double('song')
          allow(Song).to receive(:from_upload).and_return(song)
          note = double('note')
          allow(note).to receive(:letter).and_return('D')
          allow(note).to receive(:num_beats).and_return(1)
          allow(song).to receive(:notes).and_return Array.new(6, note)

          params = {user_email: user_email, exercise_id: exercise_id, audio: audio}

          attempt = AttemptAnalyzer.new(params).generate

          expect(attempt.class).to eq(Attempt)
          expect(upload).to have_received(:audio)
          expect(song).to have_received(:notes)
          expect(attempt.pitch_score).to eq(2)
          expect(attempt.rhythm_score).to eq(4)
        end
      end
    end
  end
end
