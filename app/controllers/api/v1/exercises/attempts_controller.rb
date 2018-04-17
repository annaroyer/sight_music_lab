class Api::V1::Exercises::AttemptsController < ApplicationController
  def create
    render json: current_user.attempts.create(attempt_params)
  end

  private

    def attempt_params
      params.require(:attempt).permit(:audio)
    end
end
