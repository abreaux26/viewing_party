class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :movie
  has_many :attendees, dependent: :destroy
  has_many :friends, through: :attendees, class_name: 'User', dependent: :destroy

  validates :name, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
