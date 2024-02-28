require "rails_helper"

RSpec.describe "Users Authenticate" do

    it "Creates a new User if given all the correct info" do
      user_data = ({
        name: "Snoopy",
        email: "redbaron@gmail.com",
        password: "woodstockrulez",
        password_confirmation: "woodstockrulez"
      })
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_data)
    
    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    new_user = User.last
    
    # require 'pry';binding.pry
    expect(new_user[:name]).to eq("#{new_user.name}")
    expect(new_user[:email]).to eq("#{new_user.email}")
    
    parse = JSON.parse(response.body, symbolize_names: true)
    user = parse[:data][:attributes]

    expect(user).to have_key(:name)
    expect(user[:name]).to be_a(String)

    expect(user).to have_key(:email)
    expect(user[:email]).to be_a(String)

    expect(user).to have_key(:password_digest)
    expect(user[:password_digest]).to be_a(String)
  end

  it "returns an error when given incomplete user_data" do
    user_data = ({
      name: "Snoopy",
      email: "redbaron@gmail.com",
      password: "woodstockrulez"
    })

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_data)
    
    expect(response).to_not be_successful
    expect(response.status).to eq(422)
  end
end