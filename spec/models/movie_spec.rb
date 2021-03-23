require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should have_many :events}
  end

  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :api_movie_id}
    it { should validate_uniqueness_of :api_movie_id}
  end
end
