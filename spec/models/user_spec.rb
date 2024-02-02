require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:user_breads)}
  end

  describe "validations" do
    it { should validate_presence_of(:name)}
    # it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    # it { should validate_format_of(:email).with(URI::MailTo::EMAIL_REGEXP) }
    it { should validate_presence_of(:password_digest)}

    context "when email is valid" do
      let(:user) {User.new(name: "Fake", email: "fakeemail@fake.com", password_digest: "fakepassword")}

      it "is valid" do
        expect(user).to be_valid
      end
    end

    context "when email is not valid" do
      let(:user) {User.new(name: "Fake", email: "fakeemailcom", password_digest: "fakepassword")}

      it "is invalid" do
        expect(user).to_not be_valid
      end
    end
  end
end