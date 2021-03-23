class User < ApplicationRecord
  has_secure_password
  has_many :user_friends, foreign_key: [:sender_id, :receiver_id], class_name: 'UserFriend', dependent: :destroy
  has_many :events, class_name: 'Event', foreign_key: :host_id, dependent: :destroy, inverse_of: :host

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
