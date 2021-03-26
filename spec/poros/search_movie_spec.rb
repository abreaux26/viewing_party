require 'rails_helper'

RSpec.describe SearchMovie do
  before :each do
    @searchmovie1 = SearchMovie.new({
      id: 1,
      title: "Search Movie 1",
      vote_average: 8
    })
  end

  it 'can be created' do

    expect(@searchmovie1.class).to eq(SearchMovie)
  end

  it 'has valid attributes' do

    expect(@searchmovie1.id).to eq(1)
    expect(@searchmovie1.title).to eq("Search Movie 1")
    expect(@searchmovie1.vote_average).to eq(8)
  end
end