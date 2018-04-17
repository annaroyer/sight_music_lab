class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:user_id] = user.uid
    if user.save
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
