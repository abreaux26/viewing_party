class Movie < ApplicationRecord

  has_many :events

  validates :title, presence: true
  validates :api_movie_id, presence: true, uniqueness: true
end
