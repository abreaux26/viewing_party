require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe "relationships" do
    it { should belong_to :event}
    it { should belong_to(:friend).class_name('User')}
  end

  describe "class methods" do
    it "returns all events a user is invited too" do
      @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
      @user2 = User.create!(username: 'user2', email: 'user2@email.com', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      @event1 = @user2.events.create!(name: "Zack Snyder's Justice League", duration: 242, start_time: Time.new(2021), api_movie_id: 791373)

      @attendee1 = @event1.attendees.create!(friend_id: @user1.id)

     expect(Attendee.invited(@user1).first.event).to eq(@event1)
    end
  end
end
