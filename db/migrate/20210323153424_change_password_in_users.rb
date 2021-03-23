class ChangePasswordInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password, :string, column_name: :password_digest
  end
end
