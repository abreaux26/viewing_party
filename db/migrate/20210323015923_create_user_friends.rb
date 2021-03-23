class CreateUserFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :user_friends do |t|
      t.references :sender
      t.references :receiver
      t.timestamps
    end
    add_foreign_key :user_friends, :users, column: :sender_id, primary_key: :id
    add_foreign_key :user_friends, :users, column: :receiver_id, primary_key: :id
  end
end
