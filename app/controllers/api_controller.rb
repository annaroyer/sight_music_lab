class ApiController < ActionController::API
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(uid: session[:user_id]) || Guest.new
  end
end
