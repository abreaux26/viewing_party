require 'rails_helper'

RSpec.describe 'new event page', type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    @user2 = User.create!(username: 'user2', email: 'user2@email.com', password: 'password')
    @user3 = User.create!(username: 'user3', email: 'user3@email.com', password: 'password')
    @user4 = User.create!(username: 'user4', email: 'user4@email.com', password: 'password')

    UserFriend.create!(user: @user1, friend: @user2)
    UserFriend.create!(user: @user1, friend: @user3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    VCR.use_cassette('top_forty_movies') do
      visit movies_path
      click_on('Find Top 40 Movies')
      @movie_title = find(".title", match: :first).text
      click_on(@movie_title)
      click_on('Create a Viewing Party')
    end
  end
# As an authenticated user,
# When I visit the new viewing party page,
# I should see the name of the movie title rendered above a form with the following fields:
  it 'should see the name of the movie title' do

    expect(page).to have_content(@movie_title)
  end
# Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
# When: field to select date
# Start Time: field to select time
# Checkboxes next to each friend (if user has friends)
# Button to create a party
# Details When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.

end