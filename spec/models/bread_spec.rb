require 'rails_helper'

RSpec.describe Bread, type: :model do
  describe "relationships" do
    it { should belong_to(:country)}
  end

  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:recipe)}
  end  
end
