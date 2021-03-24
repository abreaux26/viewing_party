class UsersController < ApplicationController
  def dashboard
  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:username] = user[:username].downcase
    new_user = User.create(user)
    if new_user.save
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
