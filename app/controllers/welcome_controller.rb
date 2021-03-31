class WelcomeController < ApplicationController
  def index; end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now.alert = 'Invalid Credentials!'
      render :index
    end
  end
end
