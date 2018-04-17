class Api::V1::Exercises::AttemptsController < ApiController
  def create
    render json: current_user.attempts.create(attempt_params)
  end

  private

    def attempt_params
      params.permit(:exercise_id, :audio)
    end

    def current_user
      User.find_by(email: params[:user_email])
    end
end
