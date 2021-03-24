class AddStatusToUserFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :user_friends, :status, :integer, default: 0
  end
end
