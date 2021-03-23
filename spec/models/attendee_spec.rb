require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe "relationships" do
    it { should belong_to :event}
    it { should belong_to(:friend).class_name('User')}
  end
end
