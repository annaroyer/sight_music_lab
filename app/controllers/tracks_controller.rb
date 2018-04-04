class TracksController < ApplicationController
  def create
    binding.pry
    track = params[:track][:audio].tempfile
    conn = Faraday.new('https://api.sonicapi.com/')
    payload = {
      access_id: ENV['SONICAPI_KEY'],
      format: 'json',
      input_file: track
    }.to_json
    response = conn.post('analyze/melody') do |faraday|
              faraday.body = payload
            end
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
