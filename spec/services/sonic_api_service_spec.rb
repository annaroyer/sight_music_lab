require 'rails_helper'

describe SonicApiService do
  context 'class methods' do
    describe '.post_file' do
      it 'returns the json from posting an audio file url to the sonic api' do
        VCR.use_cassette('melody_result') do
          url = "https://sight-music-lab.s3-us-west-1.amazonaws.com/attempts/audios/000/000/020/original/recorded.mp3"

          melody_result = SonicApiService.post_file(url)

          expect(melody_result.first[:midi_pitch]).to eq(58.236053466796875)
        end
      end
    end
  end
end
