require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :outgoing_friend_requests}
    it { should have_many :incoming_friend_requests}
    it { should have_many :events}
  end

  describe "validations" do
    it { should validate_presence_of :username}
    it { should validate_uniqueness_of :username}
    it { should validate_presence_of :email}
    it { should validate_uniqueness_of :email}
    it { should validate_presence_of :password}
  end
end
