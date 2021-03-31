class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendees, dependent: :destroy
  has_many :friends, through: :attendees, class_name: 'User', dependent: :destroy

  validates :name, presence: true
  validates :duration, presence: true
  validates :start_time, presence: true
  validates :api_movie_id, presence: true

  def message
    "Event Details:\n
    Movie: #{name}\n
    Host: #{host.username}\n
    Duration: #{duration}\n
    Start Time: #{start_time.strftime('%B %d, %Y %l:%M %p')}"
  end
end
