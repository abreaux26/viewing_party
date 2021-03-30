class ChangeDateAndTimeInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date
    remove_column :events, :time
    add_column :events, :start_time, :datetime
  end
end
