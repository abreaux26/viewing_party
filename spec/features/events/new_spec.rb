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
      click_on('Top 40 Movies')
      @movie = MovieService.movie_detail_for(19404)
      visit "movies/#{@movie[:id]}"
      click_on('Create a Viewing Party')
    end
  end

  it 'should see the name of the movie title' do

    expect(page).to have_content(@movie_title)
  end

  it 'should have a field for a name' do

    expect(page).to have_field('name')
  end

  it 'should have a field for duration' do

    expect(page).to have_field('duration')
  end

  it 'should have a field to select a start time' do

    expect(page).to have_field('start_time')
  end

  it 'should have checkboxes next to each friend' do
    expect(page).to have_css("input[type='checkbox']", id: "friends_#{@user2.id}")
    expect(page).to have_css("input[type='checkbox']", id: "friends_#{@user3.id}")
    expect(page).to_not have_css("input[type='checkbox']", id: "friends_#{@user4.id}")
  end 

  it 'should have a button to create a party' do

    expect(page).to have_button('Create Viewing Party')
  end

  it 'can create a new viewing party' do
    VCR.use_cassette('create_viewing_party') do
      fill_in 'name', with: 'event 1'
      fill_in 'duration', with: '200'
      fill_in 'start_time', with: DateTime.new(2021, 4, 3, 15, 30)
      find("#friends_#{@user2.id}").check
      click_on('Create Viewing Party')

      expect(current_path).to eq(dashboard_path)
    end
  end

  it 'wont create the viewing party if the duration is shorter than the movie runtime' do
    VCR.use_cassette('top_forty_movies') do
      fill_in 'name', with: 'event 1'
      fill_in 'duration', with: '100'
      fill_in 'start_time', with: DateTime.new(2021, 4, 3, 15, 30)
      find("#friends_#{@user2.id}").check
      click_on('Create Viewing Party')

      expect(page).to have_content("Please enter a duration longer than #{@movie[:runtime]} minutes.")
    end
  end

  it 'wont create the viewing party without all of the required fields' do
    VCR.use_cassette('top_forty_movies_required_fields') do
      fill_in 'duration', with: '210'
      click_on('Create Viewing Party')

      expect(page).to have_content("You must've forgot some information, try again!")
    end
  end
end