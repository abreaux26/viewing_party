require 'rails_helper'

RSpec.describe 'user dashboard page', type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
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
end
