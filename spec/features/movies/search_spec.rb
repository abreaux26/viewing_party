require 'rails_helper'
RSpec.describe 'As an authenticated user', type: :feature do
  describe 'From the discover_path' do
    before :each do
      @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit discover_path
    end

    it 'I should see the 40 results from "Find Top 40 Movies" button' do
      VCR.use_cassette('top_forty') do
        click_on('Find Top 40 Movies')

        expect(current_path).to eq(movies_path)

        expect(page).to have_css(".movie", count: 40)

        within(first(".movie")) do
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_average")
        end
      end
    end

    it 'I should see results from search' do
      VCR.use_cassette('search_movie_data') do

        fill_in :q, with: 'Phoenix'

        click_on('Search by Movie Title')

        expect(current_path).to eq(movies_path)

        expect(page).to have_css(".movie", maximum: 40)

        within(first(".movie")) do
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_average")
        end
      end
    end
  end

  xdescribe 'From the movies_path' do
    before :each do
      @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit movies_path
    end

    it 'I should see the 40 results from my search' do

    end

    it 'shows a button to discover top 40 movies' do

      expect(page).to have_link('Find Top 40 Movies')
    end

    it 'top 40 movies button takes you to the movies page' do
      click_link 'Find Top 40 Movies'

      expect(current_path).to eq(movies_path)
    end

    it 'has an option to search for movies by keyword(title)' do

      expect(page).to have_field('q')
      expect(page).to have_button('Search by Movie Title')
    end
  end
end
