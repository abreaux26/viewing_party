class UserFriend < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  enum status: [:pending, :accepted]

  validates_presence_of :status
end
