class Api::V1::AttemptsController < ApiController
  def create
    attempt = Attempt.create(params[:melody_result])
    render json: attempt
  end
end
