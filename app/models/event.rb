class Event < ApplicationRecord

  belongs_to :host, class_name: 'User'
  belongs_to :movie
  has_many :attendees
  has_many :friends, through: :attendees, class_name: 'User'

  validates :name, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
