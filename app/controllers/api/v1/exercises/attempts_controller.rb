class Api::V1::Exercises::AttemptsController < ApiController
  def create
    render json: exercise.attempts.create(attempt_params)
  end

  private

    def attempt_params
      params.require(:attempt).permit(:audio, :user_email)
    end

    def exercise
      Exercise.find(params[:exercise_id])
    end
end
