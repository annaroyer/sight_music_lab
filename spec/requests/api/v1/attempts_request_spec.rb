require 'rails_helper'

describe 'Attempts API' do
  context 'post api/v1/attempts' do
    it 'returns notational representation of the melodic analysis' do
      post '/api/v1/attempts', params:  melody_analysis

      binding.pry
      attempt = JSON.parse(response.body)
      expect(attempt.first).to eq([{duration: :h, name: 'E/4'}, {duration: :h, name: 'B/4'}])
      expect(attempt.first).to eq([{duration: :w, name: 'E/4'}])
    end
  end
end


def melody_analysis
  {status: {code: "200"},
    melody_result:
    {key: "A# Maj", key_index: "10", tuning_frequency: "439.9074401855469",
      0 => {midi_pitch: "55.389259338378906", onset_time: "0.005328798185941043", duration: "0.3031065759637188", volume: "0.000553264981135726"},
      1 => {midi_pitch: "58.07857131958008", onset_time: "1.154263038548753", duration: "0.44081632653061226", volume: "0.7653452157974243"},
      2 => {midi_pitch: "61.89057922363281", onset_time: "1.6017913832199546", duration: "0.4591609977324263", volume: "0.5652092695236206"},
      3 => {midi_pitch: "64.90135955810547", onset_time: "2.0637868480725623", duration: "0.4955328798185941", volume: "0.3952583968639374"},
      4 => {midi_pitch: "61.90035629272461", onset_time: "2.562517006802721", duration: "0.5079818594104308", volume: "0.5193013548851013"},
      5 => {midi_pitch: "57.98161315917969", onset_time: "3.07421768707483", duration: "0.7405442176870748", volume: "0.6150729656219482"}
    }
  }
end
