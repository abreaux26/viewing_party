require 'rails_helper'

RSpec.describe 'discover movies page', type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit discover_path
  end

  it 'shows a button to discover top 40 movies' do

    expect(page).to have_link('Find Top 40 Movies')
  end

  it 'top 40 movies button takes you to the movies page' do
    VCR.use_cassette('top_forty') do
      click_link 'Find Top 40 Movies'

      expect(current_path).to eq(movies_path)
    end
  end

  it 'has an option to search for movies by keyword(title)' do

    expect(page).to have_field('q')
    expect(page).to have_button('Search by Movie Title')
  end

  it 'search by movie title takes you to the movies page' do
    VCR.use_cassette('search_movie_data') do
      fill_in 'q', with: 'Phoenix'
      click_button 'Search by Movie Title'

      expect(current_path).to eq(movies_path)
    end
  end
end
