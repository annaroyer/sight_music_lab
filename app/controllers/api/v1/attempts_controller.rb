class Api::V1::AttemptsController < ApiController
  def create
    current_user = User.first
    render json: current_user.attempts.create(attempt_params)
  end

  private

    def attempt_params
      params.require(:attempt).permit(:audio)
    end
end
