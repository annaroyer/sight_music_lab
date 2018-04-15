class Api::V1::AttemptsController < ApiController
  def create
    current_user = User.first
    render json: current_user.attempts.create(song: song)
  end

  private

    def song
      response = conn.post('', payload)
      raw_song = JSON.parse(response.body, symbolize_names: true)[:melody_result]
      Song.new(raw_song)
    end

    def input_file
      Faraday::UploadIO.new(
       params[:input_file].tempfile.path,
       params[:input_file].content_type,
       params[:input_file].original_filename
      )
    end

    def payload
      { input_file: input_file }
    end

    def conn
      Faraday.new('https://api.sonicapi.com/analyze/melody?access_id=67a84cd6-5d82-4f3b-bf96-752496ab2670&format=json') do |f|
       f.request :multipart
       f.request :url_encoded
       f.adapter Faraday.default_adapter
      end
    end
end
