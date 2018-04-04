class HomeController < ApplicationController
  def index
    @track = Track.new
  end
end
