class Api::V1::AttemptsController < ApiController
  def create
    attempt = current_user.attempts.create(song: song)
    binding.pry
    render json: attempt
  end

  private
    def song
      Song.new(params[:melody_result])
    end
end
