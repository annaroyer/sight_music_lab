class Api::V1::Exercises::AttemptsController < ApiController

  def create
    attempt = AttemptAnalyzer.new(attempt_params).generate
    render json: attempt
  end

  private
    def attempt_params
      params.permit(:user_email, :exercise_id, :audio)
    end
end
