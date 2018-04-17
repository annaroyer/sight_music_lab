class Api::V1::Exercises::AttemptsController < ApiController

  def create
    render json: current_user.attempts.create(attempt_params)
  end

  private

    def attempt_params
      params.permit(:exercise_id, :audio)
    end
end
