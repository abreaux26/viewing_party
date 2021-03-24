class ChangeColumnsInUserFriends < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_friends, :sender_id, :user_id
    rename_column :user_friends, :receiver_id, :friend_id
  end
end
