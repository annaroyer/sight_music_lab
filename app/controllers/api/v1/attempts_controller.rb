class Api::V1::AttemptsController < ApiController
  def create
    attempt = current_user.attempts.create(attempt_params)
    render json: attempt
  end

  private
    def attempt_params
      {score: 5, song: song}
    end

    def song
      Song.new(params[:melody_result])
    end
end
