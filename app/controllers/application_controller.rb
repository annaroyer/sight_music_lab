class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login

  def current_user
    @current_user ||= User.find_by(uid: session[:user_id]) || Guest.new
  end

  def require_login
    return '404' if current_user.role == 'guest'
  end
end
