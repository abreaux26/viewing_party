class User < ApplicationRecord
  has_secure_password
  has_many :user_friends, foreign_key: %i[sender_id receiver_id], class_name: 'UserFriend', dependent: :destroy, inverse_of: %i[sender receiver]
  has_many :events, class_name: 'Event', foreign_key: :host_id, dependent: :destroy, inverse_of: :host

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
