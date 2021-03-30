require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "relationships" do
    it { should belong_to(:host).class_name('User')}
    it { should have_many :attendees}
    it {should have_many(:friends).through(:attendees).class_name('User')}
  end

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :duration}
    it { should validate_presence_of :start_time}
    it { should validate_presence_of :api_movie_id }
  end
end
