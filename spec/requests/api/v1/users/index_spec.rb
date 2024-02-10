require "rails_helper"

RSpec.describe "Users Index" do
  it "Returns all Users" do
    user1 = User.create!(name: "Eric", email: "papi@bread.com", password_digest: "oi")
    user2 = User.create!(name: "Snoopy", email: "redbaron@gmail.com", password_digest: "woodstockrulez")
    user3 = User.create!(name: "Woodstock", email: "snoopypal@gmail.com", password_digest: "chickenscratch")

    get "/api/v1/users"
    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(response_body[:data]).to be_a(Array)
    expect(response_body[:data].count).to eq(3)

    response_body[:data].each do |user|
      expect(user).to have_key(:id)
      expect(user).to have_key(:type)
      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to be_a(Hash)
      expect(user[:attributes]).to have_key(:name)
      expect(user[:attributes][:name]).to be_a(String)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes]).to have_key(:password_digest)
      expect(user[:attributes][:password_digest]).to be_a(String)
    end
  end
end