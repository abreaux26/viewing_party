require 'rails_helper'
RSpec.describe 'As an authenticated user', type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: '123')
    @user2 = User.create!(username: 'user2', email: 'user2@email.com', password: '123')
    @user3 = User.create!(username: 'user3', email: 'user3@email.com', password: '123')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    visit dashboard_path
  end

  it 'I see a text field to enter a friends email and a button to "Add Friend"' do
    expect(page).to have_field(:friend)
    expect(page).to have_button('Add Friend')
  end

  it 'I see "You currently have no friends" when I have no friends' do
    within('#friends') do
      expect(page).to have_content("You currently have no friends")
    end
  end

  it 'I see a list of all my friends' do
    fill_in :friend, with: @user2.email
    click_button('Add Friend')

    within('#friends') do
      expect(page).to have_content(@user2.username)
      expect(page).not_to have_content(@user3.username)
    end
  end

  it 'I see error message if I enter an invalid email' do
    fill_in :friend, with: 'user4@email.com'
    click_button('Add Friend')
    expect(page).to have_content("User doesn't exist.")
  end

  it 'you cannot add yourself as a friend' do
    fill_in :friend, with: @user1.email
    click_button('Add Friend')

    expect(page).to have_content("Cannot add yourself as a friend.")
  end
end
