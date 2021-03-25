class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @friends = @user.friends
  end
end
