class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :event, foreign_key: true
      t.references :friend
      t.timestamps
    end
    add_foreign_key :attendees, :users, column: :friend_id, primary_key: :id
  end
end
