require 'rails_helper'

RSpec.describe Review do
  before :each do
    @review1 = Review.new({author: "Author 1", content: "review 1 content"})
    @review2 = Review.new({author: "Author 2", content: "review 2 content"})
  end

  it 'can be created' do

    expect(@review1.class).to eq(Review)
    expect(@review2.class).to eq(Review)
  end

  it 'has valid attributes' do

    expect(@review1.author).to eq("Author 1")
    expect(@review1.content).to eq("review 1 content")
    expect(@review2.author).to eq("Author 2")
    expect(@review2.content).to eq("review 2 content")
  end
end