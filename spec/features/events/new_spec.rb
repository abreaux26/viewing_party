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

  it 'should see the name of the movie title' do

    expect(page).to have_content(@movie_title)
  end

  it 'should have a field for duration' do

    expect(page).to have_field('duration')
  end

  it 'should have a field to select a date' do

    expect(page).to have_field('date')
  end

  it 'should have a field to select a time' do

    expect(page).to have_field('time')
  end

  it 'should have checkboxes next to each friend' do
    expect(page).to have_css("input[type='checkbox']", id: "friend_#{@user2.id}")
    expect(page).to have_css("input[type='checkbox']", id: "friend_#{@user3.id}")
    expect(page).to_not have_css("input[type='checkbox']", id: "friend_#{@user4.id}")
  end 

  it 'should have a button to create a party' do

    expect(page).to have_button('Create Viewing Party')
  end
end