class User < ApplicationRecord
  has_secure_password
  has_many :user_friends, dependent: :destroy
  has_many :friends, through: :user_friends

  has_many :events, class_name: 'Event',
                    foreign_key: :host_id,
                    inverse_of: :host,
                    dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
