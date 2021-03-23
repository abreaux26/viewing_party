class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :api_movie_id
      t.string :title
      t.timestamps
    end
  end
end
