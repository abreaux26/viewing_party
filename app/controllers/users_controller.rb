class UsersController < ApplicationController
  def index
    @user = current_user
    @friends = @user.friends
  end
end
