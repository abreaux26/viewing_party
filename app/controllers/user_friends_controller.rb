class UserFriendsController < ApplicationController
  def create
    if params[:friend]
      friend = User.find_by(email: params[:friend])
      if friend.nil?
        flash[:error] = "User doesn't exist."
      else
        current_user.user_friends.create!(friend: friend)
      end
    end
    redirect_to dashboard_path
  end
end
