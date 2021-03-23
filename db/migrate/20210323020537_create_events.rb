class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.references :movie, foreign_key: true
      t.integer :duration
      t.date :date
      t.time :time
      t.references :host
      t.timestamps
    end
    add_foreign_key :events, :users, column: :host_id, primary_key: :id
  end
end
