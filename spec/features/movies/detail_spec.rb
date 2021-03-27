require 'rails_helper'
RSpec.describe "When I visit the movies detail page", type: :feature do
  xit 'I see information about the movie' do
    visit discover_path

    VCR.use_cassette('top_forty') do
      click_on('Find Top 40 Movies')
      # binding.pry
      # find(".title", match: :first)
      # find('.movie_id', match: :first, visible: false).text
      # find(".movie_id", match: :first).text

      # expect(current_path).to eq(movie_path(first(".movie").id))

      # expect(page).to have_css(".title")
      # expect(page).to have_css(".vote_average")
      # expect(page).to have_css(".runtime")
      # expect(page).to have_css(".genres")
      expect(page).to have_css(".summary")
      expect(page).to have_css(".cast")
      expect(page).to have_css(".review")
    end
  end
end
