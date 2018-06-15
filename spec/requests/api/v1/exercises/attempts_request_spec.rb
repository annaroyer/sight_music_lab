require 'rails_helper'

describe 'Attempts API' do
  context 'post api/v1/exercises/:id/attempts' do
    it 'returns notational representation of the melodic analysis' do
      user = create(:user)
      exercise = create(:exercise)

      url = "https://sight-music-lab.s3-us-west-1.amazonaws.com/attempts/audios/000/000/020/original/recorded.mp3"
      upload = double('upload')
      audio = double('audio')
      allow(audio).to receive(:url).and_return(url)
      allow(upload).to receive(:audio).and_return(audio)
      allow(Upload).to receive(:create).and_return(upload)

      melody_result = File.open('./spec/fixtures/melody.json')

      stub_request(:post, "https://api.sonicapi.com/analyze/melody?access_id=#{ENV['SONIC_API_KEY']}&format=json&input_file=#{url}")
        .to_return(status: 200, body: melody_result, headers: {})

      post "/api/v1/exercises/#{exercise.id}/attempts", params:  { 'audio' => url, 'user_email' => user.email }

      attempt = JSON.parse(response.body, symbolize_names: true)

      expect(attempt[:song][:key]).to eq("A^ Maj")
      expect(attempt[:song][:tse]).to eq("4/4")
      expect(attempt[:song][:each_beat]).to eq("1/4")
      expect(attempt[:song][:notes]).to eq(["z1", "^A,2", "D2 | ", "F2", "D2", "^A,3 | "])
      expect(attempt[:pitch_score]).to eq(5)
      expect(attempt[:rhythm_score]).to eq(5)
    end
  end
end
