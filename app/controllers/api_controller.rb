class ApiController < ActionController::API
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(uid: session[:user_id]) || Guest.new
  end
end

def require_login!
  return true if authenticate_token
  render json: { errors: [ { detail: "Access denied" } ] }, status: 401
end
