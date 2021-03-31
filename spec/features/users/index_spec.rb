require 'rails_helper'

RSpec.describe 'user dashboard page', type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    @user2 = User.create!(username: 'user2', email: 'user2@email.com', password: 'password')
    @user3 = User.create!(username: 'user3', email: 'user3@email.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    @event1 = @user1.events.create!(name: "Zack Snyder's Justice League", duration: 242, start_time: Time.new(2021), api_movie_id: 791373)
    @event2 = @user2.events.create!(name: "The Shawshank Redemption", duration: 142, start_time: Time.new(2022), api_movie_id: 791373)
    @attendee1 = @event2.attendees.create!(friend_id: @user1.id)
    @attendee2 = @event1.attendees.create!(friend_id: @user2.id)
    @attendee3 = @event1.attendees.create!(friend_id: @user3.id)
    @attendee4 = @event2.attendees.create!(friend_id: @user3.id)
    visit dashboard_path
  end

  it 'shows a welcome header' do
    expect(page).to have_content("Welcome #{@user1.username}!")
  end

  it 'has a button to discover movies' do

    expect(page).to have_link('Discover Movies')
    click_link('Discover Movies')
    expect(current_path).to eq("/discover")
  end

  it 'has a friends section' do

    expect(page).to have_content("Friends")
  end

  it 'has a viewing parties section' do

    expect(page).to have_content("Viewing Parties")
  end

  it 'shows viewing parties the user is hosting' do
    within(".hosting") do
      expect(page).to have_content(@event1.name)
      expect(page).to have_content(@event1.start_time.strftime('%B %d, %Y%l:%M %p'))
      expect(page).to have_content("Hosting")
      expect(page).to have_content(@user2.username)
      expect(page).to have_content(@user3.username)
    end
  end

  it 'shows viewing parties the user is attending' do
    within(".attending") do
      expect(page).to have_content(@event2.name)
      expect(page).to have_content(@event2.start_time.strftime('%B %d, %Y%l:%M %p'))
      expect(page).to have_content("Invited")
      expect(page).to have_content(@user1.username)
      expect(page).to have_content(@user3.username)
    end
  end

end
