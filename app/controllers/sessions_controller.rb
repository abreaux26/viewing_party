class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = user_params
    new_user[:username] = new_user[:username].downcase
    new_user[:email] = new_user[:email].downcase
    @user = User.create(new_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now.alert = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
