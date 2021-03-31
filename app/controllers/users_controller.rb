class UsersController < ApplicationController
  def index
    @user = current_user
    @friends = @user.friends
    @invited = Attendee.invited(@user)
  end
end
