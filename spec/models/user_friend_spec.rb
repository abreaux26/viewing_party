require 'rails_helper'

RSpec.describe UserFriend, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to(:friend).class_name('User') }
  end
  describe "validations" do
    it { should validate_presence_of :status }
  end
end
