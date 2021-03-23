class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :friend, class_name: 'User'
end
