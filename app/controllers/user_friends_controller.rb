class UserFriendsController < ApplicationController
  def create
    if params[:friend]
      friend = User.find_by(email: params[:friend])
      current_user.user_friends.create!(friend: friend) if friend_validation(friend).nil?
    end
    redirect_to dashboard_path
  end

  def friend_validation(friend)
    if friend.nil?
      flash[:error] = "User doesn't exist."
    elsif friend.email == current_user.email
      flash[:error] = 'Cannot add yourself as a friend.'
    end
  end
end
