require "rails_helper"

RSpec.describe "Users Show" do
  it "Returns a specific User" do
    user1 = User.create!(name: "Eric", email: "papi@bread.com", password_digest: "oi")
    user2 = User.create!(name: "Snoopy", email: "redbaron@gmail.com", password_digest: "woodstockrulez")
    user3 = User.create!(name: "Woodstock", email: "snoopypal@gmail.com", password_digest: "chickenscratch")

    get "/api/v1/users/#{user2.id}"
    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(response_body[:data]).to be_a(Hash)
    expect(response_body[:data].count).to eq(3)
    expect(response_body[:data]).to have_key(:id)
    expect(response_body[:data]).to have_key(:type)
    expect(response_body[:data]).to have_key(:attributes)

    user = response_body[:data][:attributes]

    expect(user).to be_a(Hash)
    expect(user).to have_key(:name)
    expect(user[:name]).to be_a(String)
    expect(user).to have_key(:email)
    expect(user[:email]).to be_a(String)
    expect(user).to have_key(:password_digest)
    expect(user[:password_digest]).to be_a(String)
  end
end