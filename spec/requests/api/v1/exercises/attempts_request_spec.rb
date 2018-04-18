require 'rails_helper'

describe 'Attempts API' do
  context 'post api/v1/exercises/:id/attempts' do
    it 'returns notational representation of the melodic analysis' do
      user = create(:user)
      exercise = create(:exercise)

      url = "https://sight-music-lab.s3-us-west-1.amazonaws.com/attempts/audios/000/000/020/original/recorded.mp3"
      allow_any_instance_of(Api::V1::Exercises::AttemptsController).to receive(:upload).and_return(url)

      melody_result = File.open('./spec/fixtures/melody.json')

      stub_request(:post, "https://api.sonicapi.com/analyze/melody?access_id=#{ENV['SONIC_API_KEY']}&format=json&input_file=#{url}")
        .to_return(status: 200, body: melody_result, headers: {})

      post "/api/v1/exercises/#{exercise.id}/attempts", params:  { 'audio' => url, 'user_email' => user.email }

      attempt = JSON.parse(response.body, symbolize_names: true)

      expect(attempt[:song][:key]).to eq("A^ Maj")
      expect(attempt[:song][:tse]).to eq("4/4")
      expect(attempt[:song][:each_beat]).to eq("1/4")
      expect(attempt[:song][:notes]).to eq(["z1", "A^,1", "D1", "F1", "D1", "A^,2"])
    end
  end
end
