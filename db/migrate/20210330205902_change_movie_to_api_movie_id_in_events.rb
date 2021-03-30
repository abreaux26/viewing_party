class ChangeMovieToApiMovieIdInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :movie_id
    add_column :events, :api_movie_id, :integer
  end
end
