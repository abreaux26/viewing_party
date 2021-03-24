class User < ApplicationRecord
  has_secure_password
  has_many :outgoing_friend_requests, foreign_key: :sender_id,
                                      class_name: 'UserFriend',
                                      inverse_of: :sender,
                                      dependent: :destroy
  has_many :incoming_friend_requests, foreign_key: :receiver_id,
                                      class_name: 'UserFriend',
                                      inverse_of: :receiver,
                                      dependent: :destroy
  has_many :events, class_name: 'Event',
                    foreign_key: :host_id,
                    inverse_of: :host,
                    dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
