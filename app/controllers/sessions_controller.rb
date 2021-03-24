class SessionsController < ApplicationController
  before_action :password_confirmed?, only: [:create]

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:username] = user[:username].downcase
    new_user = User.create(user)
    if new_user.save && password_confirmed?
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      if !password_confirmed?
        flash[:error] += "Password confirmation required"
      end
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def password_confirmed?
    params[:user][:password_confirmation] == params[:user][:password]
  end
end
