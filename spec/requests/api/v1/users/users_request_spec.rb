require "rails_helper"

RSpec.describe 'Users API endpoints' do
  describe "Post /api/v1/users" do
    it "recieves a new user's information that is saved as a user" do
      user_params = ({
        "name": "Joe Cool",
        "email": "snoopy@snoop.com",
        "password": "Woodstockroolz",
        "password_confirmation": "Woodstockroolz"
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_info = JSON.parse(response.body, symbolize_names: true)

      expect(user_info).to be_a(Hash)

      expect(user_info[:data]).to be_a(Hash)
      expect(user_info[:data]).to have_key(:id)
      expect(user_info[:data][:id]).to_not be(nil)
      expect(user_info[:data]).to have_key(:type)
      expect(user_info[:data][:type]).to eq("user")
      expect(user_info[:data]).to have_key(:attributes)
      expect(user_info[:data][:attributes]).to be_a(Hash)

      user = user_info[:data][:attributes]

      expect(user).to have_key(:name)
      expect(user).to have_key(:email)
      expect(user).to have_key(:password_digest)

      expect(user[:name]).to be_a(String)
      expect(user[:name]).to eq("Joe Cool")
      expect(user[:email]).to be_a(String)
      expect(user[:email]).to eq("snoopy@snoop.com")
      expect(user[:password_digest]).to be_a(String)

      user_object = User.last

      expect(user_object.name).to eq("Joe Cool")
    end
    
    it "returns a 400 error if passwords to not match" do
      user_params = ({
        "name": "Joe Cool",
        "email": "snoopy@snoop.com",
        "password": "Woodstockroolz",
        "password_confirmation": "Woodstockdoesnotinfactrule"
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      user_info = JSON.parse(response.body, symbolize_names: true)

      expect(user_info).to be_a(Hash)
      expect(user_info[:status]).to be_a(Integer)
      expect(user_info[:status]).to eq(422)
      expect(user_info[:error]).to be_a(String)
      expect(user_info[:error]).to eq("Passwords do not match.")
    end

    it "returns a 400 error if the email is aleady in use by antoher user" do
      existing_user = User.create!(name: "Woodstock", email: "snoopy@snoop.com", password: "Snoopsux", password_confirmation: "Snoopsux")
      user_params = ({
        "name": "Joe Cool",
        "email": "snoopy@snoop.com",
        "password": "Woodstockroolz",
        "password_confirmation": "Woodstockroolz"
      })
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      user_info = JSON.parse(response.body, symbolize_names: true)

      expect(user_info).to be_a(Hash)
      expect(user_info[:status]).to be_a(Integer)
      expect(user_info[:status]).to eq(422)
      expect(user_info[:error]).to be_a(String)
      expect(user_info[:error]).to eq("This email already has an account with us.")
    end
  end
end