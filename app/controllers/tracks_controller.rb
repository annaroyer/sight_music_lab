class TracksController < ApplicationController
  def create
    binding.pry
    track = Track.create(track_params)
    file = File.open(track.audio.path)
    conn = Faraday.new('https://api.sonicapi.com/')
    response = conn.post('analyze/melody') do |faraday|
              faraday.params['access_id'] = ENV['SONICAPI_KEY']
              faraday.params['format'] = 'json'
              faraday.params['input_file'] = file
            end
            binding.pry
    music = JSON.parse(response.body, symbolize_names: true)
  end

  def show
    track = Track.find(params[:id])
  end

  private
    def track_params
      params.require(:track).permit(:audio)
    end
end
