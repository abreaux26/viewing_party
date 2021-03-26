require 'rails_helper'

RSpec.describe Cast do
  before :each do
    @cast1 = Cast.new({name: "Tommy Chong", character: "Chong"})
    @cast2 = Cast.new({name: "Chris Evans", character: "Captain America"})
  end

  it 'can be created' do

    expect(@cast1.class).to eq(Cast)
    expect(@cast2.class).to eq(Cast)
  end

  it 'has valid attributes' do

    expect(@cast1.name).to eq("Tommy Chong")
    expect(@cast1.character).to eq("Chong")
    expect(@cast2.name).to eq("Chris Evans")
    expect(@cast2.character).to eq("Captain America")
  end
end