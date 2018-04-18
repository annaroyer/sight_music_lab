class Api::V1::Exercises::AttemptsController < ApiController

  def create
    render json: AttemptAnalyzer.new(attempt_params).generate
  end

  private
    def attempt_params
      params.permit(:user_email, :exercise_id, :audio)
    end
end
