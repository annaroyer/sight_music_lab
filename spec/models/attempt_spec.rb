require 'rails_helper'

describe Attempt, type: :model do
  context 'relationships' do
    it { should belong_to :user }
    it { should belong_to :exercise }
  end

  context 'instance methods' do
    describe '#song' do
      it 'calls song to instantiate from the audio url' do
        attempt = Attempt.new
        song = double('song')
        allow(Song).to receive(:from_upload).and_return(song)



        expect(attempt.song).to eq(song)
        expect(Song).to have_received(:from_upload)
      end
    end
  end
end
