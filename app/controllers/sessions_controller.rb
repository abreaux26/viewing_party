class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    downcase_params(user_params)
    @user = User.create(user_params)
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

  def downcase_params(params)
    params[:username].downcase!
    params[:email].downcase!
  end
end
