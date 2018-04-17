require 'rails_helper'

describe 'Attempts API' do
  context 'post api/v1/attempts' do
    it 'returns notational representation of the melodic analysis' do
      user = create(:user)
      allow_any_instance_of(ApiController).to receive(:current_user).and_return(user)

      melody_analysis = File.open('./spec/fixtures/melody.json')
      stub_request(:post, "https://api.sonicapi.com/analyze/melody?access_id=67a84cd6-5d82-4f3b-bf96-752496ab2670&format=json&input_file=/system/attempts/audios//original/recorded.mp3?1523930091").
         with(  headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v0.12.2'
           }).
         to_return(status: 200, body: melody_analysis, headers: {})

      song = Song.new({key: "A# Maj", key_index: "10", tuning_frequency: "439.9074401855469",
        notes: [
          {midi_pitch: "55.389259338378906", onset_time: "0.005328798185941043", duration: "0.3031065759637188", volume: "0.000553264981135726"},
          {midi_pitch: "58.07857131958008", onset_time: "1.154263038548753", duration: "0.44081632653061226", volume: "0.7653452157974243"},
          {midi_pitch: "61.89057922363281", onset_time: "1.6017913832199546", duration: "0.4591609977324263", volume: "0.5652092695236206"},
          {midi_pitch: "64.90135955810547", onset_time: "2.0637868480725623", duration: "0.4955328798185941", volume: "0.3952583968639374"},
          {midi_pitch: "61.90035629272461", onset_time: "2.562517006802721", duration: "0.5079818594104308", volume: "0.5193013548851013"},
          {midi_pitch: "57.98161315917969", onset_time: "3.07421768707483", duration: "0.7405442176870748", volume: "0.6150729656219482"}
        ]
      })

      allow_any_instance_of(Attempt).to receive(:song).and_return(song)

      post '/api/v1/attempts', params:  { 'attempt[audio]' => Rack::Test::UploadedFile.new("./spec/fixtures/recorded.mp3", 'audio/mp3') }

      attempt = JSON.parse(response.body, symbolize_names: true)

      expect(attempt[:song][:key]).to eq("A^ Maj")
      expect(attempt[:song][:tse]).to eq("4/4")
      expect(attempt[:song][:each_beat]).to eq("1/4")
      expect(attempt[:song][:notes]).to eq([["z1", "A^,1", "D1", "F1", "D1", "A^,2"]])
    end
  end
end
