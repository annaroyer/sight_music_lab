class Api::V1::AttemptsController < ApiController
  def create
    attempt = current_user.attempts.create(params[:melody_result])
    render json: attempt
  end
end
