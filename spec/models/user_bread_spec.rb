require 'rails_helper'

RSpec.describe UserBread, type: :model do
  describe "relationships" do
    it { should belong_to(:user)}
    it { should belong_to(:bread)}
  end
end
