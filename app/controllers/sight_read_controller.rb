class SightReadController < ApplicationController
  def index
    @exercise = Exercise.random
  end
end
