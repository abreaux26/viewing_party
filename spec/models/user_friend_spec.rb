require 'rails_helper'

RSpec.describe UserFriend, type: :model do
  describe "relationships" do
    it { should belong_to :sender }
    it { should belong_to :receiver }
  end
end
