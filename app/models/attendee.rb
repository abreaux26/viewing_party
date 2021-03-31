class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :friend, class_name: 'User'

  def self.invited(user)
    where('friend_id = ?', "#{user[:id]}")
  end
end
