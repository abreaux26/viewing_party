class Movie < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :title, presence: true
  validates :api_movie_id, presence: true, uniqueness: true
end
