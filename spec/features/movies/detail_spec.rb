require 'rails_helper'
RSpec.describe "When I visit the movies detail page", type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  it 'I see information about the movie' do
    visit discover_path

    VCR.use_cassette('movie_data_details') do
      fill_in :q, with: 'Phoenix'
      click_on('Search by Movie Title')

      movie_title = find(".title", match: :first).text
      vote_average = find(".vote_average", match: :first).text
      click_on(movie_title)

      # expect(current_path).to eq(movie_path(first(".movie").id))

      expect(page).to have_content(movie_title)
      expect(page).to have_content(vote_average)
      # expect(page).to have_css(".runtime")
      # expect(page).to have_css(".genres")
      expect(page).to have_css(".summary")
      expect(page).to have_css(".casts")
      expect(page).to have_css(".reviews")
    end
  end

  it 'has a button to create a viewing party' do
    visit discover_path

    VCR.use_cassette('movie_data_details') do
      fill_in :q, with: 'Phoenix'
      click_on('Search by Movie Title')

      movie_title = find(".title", match: :first).text
      vote_average = find(".vote_average", match: :first).text
      click_on(movie_title)

      expect(page).to have_link('Create a Viewing Party')

      click_on('Create a Viewing Party')

      expect(current_path).to eq(new_event_path)
    end
  end
end
