class ApiController < ActionController::API
  helper_method :current_user

  def current_user
    User.find_by(email: params[:user_email])
  end
end
