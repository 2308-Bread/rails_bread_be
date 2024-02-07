require "rails_helper"

RSpec.describe 'UserBreads API endpoints' do
  describe "Post /api/v1/user_breads" do
    it "creates a new association between an existing user and bread to store in a user's bread box" do
      user = User.create!(name: "Bill", email: "bill@bill.com", password: "scienceguy1", password_confirmation: "scienceguy1")
      country = Country.create!(name: "Italy", description: "Italian bread is diverse and regionally influenced. Ciabatta, with its irregular holes and crisp crust, is popular. Focaccia, a flatbread often topped with herbs and olive oil, hails from Genoa. Grissini, thin and crunchy breadsticks, are another Italian favorite.")
      bread = country.breads.create!(
        name: "Ciabatta",
        description: "Ciabatta is an Italian bread known for its irregular holes, chewy texture, and crisp crust. It's a versatile bread often used for sandwiches or dipping in olive oil.",
        recipe: "Ingredients: 500g bread flour 10g salt 7g active dry yeast 350ml warm water Instructions: Mix flour and salt. Dissolve yeast in warm water. Combine wet and dry ingredients, knead, and let it rise for 1-2 hours. Shape the dough, rise for 30 minutes, and bake at 425°F (220°C) for 20-25 minutes.",
        country_id: country.id
        )
      
      post "/api/v1/user_breads", params: { user_id: user.id, bread_id: bread.id }

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body[:data][0].keys.count).to eq(2)
      expect(response_body[:data][0]).to have_key(:id)
      expect(response_body[:data][0][:id]).to_not be(nil)
      expect(response_body[:data][0][:id]).to be_a(Integer)
      expect(response_body[:data][0][:attributes]).to be_an(Array)
      
      response = response_body[:data][0][:attributes][0]

      expect(response).to be_a(Hash)
      expect(response.keys.count).to eq(2)
      expect(response).to have_key(:user_attributes)
      expect(response).to have_key(:user_bread_attributes)

      expect(response[:user_attributes]).to be_a(Hash)
      expect(response[:user_attributes]).to have_key(:user_name)
      expect(response[:user_attributes]).to have_key(:email)
      expect(response[:user_attributes][:user_name]).to be_a(String)
      expect(response[:user_attributes][:user_name]).to eq(user.name)
      expect(response[:user_attributes][:email]).to be_a(String)
      expect(response[:user_attributes][:email]).to eq(user.email)

      expect(response[:user_bread_attributes]).to be_a(Array)
      expect(response[:user_bread_attributes][0]).to have_key(:bread_attributes)

      r = response[:user_bread_attributes][0][:bread_attributes]

      expect(r).to have_key(:description)
      expect(r).to have_key(:recipe)
      expect(r).to have_key(:bread_country)
      expect(r[:bread_name]).to be_a(String)
      expect(r[:bread_name]).to eq(bread.name)
      expect(r[:description]).to be_a(String)
      expect(r[:description]).to eq(bread.description)
      expect(r[:recipe]).to be_a(String)
      expect(r[:recipe]).to eq(bread.recipe)
      expect(r[:bread_country]).to be_a(String)
      expect(r[:bread_country]).to eq(bread.country.name)      
    end

    it "returns an error if passed a user or bread that doesn't exist" do
      user = User.create!(name: "Bill", email: "bill@bill.com", password: "scienceguy1", password_confirmation: "scienceguy1")
      country = Country.create!(name: "Italy", description: "Italian bread is diverse and regionally influenced. Ciabatta, with its irregular holes and crisp crust, is popular. Focaccia, a flatbread often topped with herbs and olive oil, hails from Genoa. Grissini, thin and crunchy breadsticks, are another Italian favorite.")
      bread = country.breads.create!(
        name: "Ciabatta",
        description: "Ciabatta is an Italian bread known for its irregular holes, chewy texture, and crisp crust. It's a versatile bread often used for sandwiches or dipping in olive oil.",
        recipe: "Ingredients: 500g bread flour 10g salt 7g active dry yeast 350ml warm water Instructions: Mix flour and salt. Dissolve yeast in warm water. Combine wet and dry ingredients, knead, and let it rise for 1-2 hours. Shape the dough, rise for 30 minutes, and bake at 425°F (220°C) for 20-25 minutes.",
        country_id: country.id
        )
      
      post "/api/v1/user_breads", params: { user_id: 490, bread_id: bread.id }

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body[:error_object][:message]).to eq("Couldn't find User with 'id'=490")
      expect(response_body[:error_object][:status]).to eq(404)
    end
  end

  describe "delete /api/v1/user_breads/:user_bread_id" do
    it "deletes an existing association between an existing user and bread in the user's bread box" do
      user = User.create!(name: "Bill", email: "bill@bill.com", password: "scienceguy1", password_confirmation: "scienceguy1")
      country = Country.create!(name: "Italy", description: "Italian bread is diverse and regionally influenced. Ciabatta, with its irregular holes and crisp crust, is popular. Focaccia, a flatbread often topped with herbs and olive oil, hails from Genoa. Grissini, thin and crunchy breadsticks, are another Italian favorite.")
      bread = country.breads.create!(
        name: "Ciabatta",
        description: "Ciabatta is an Italian bread known for its irregular holes, chewy texture, and crisp crust. It's a versatile bread often used for sandwiches or dipping in olive oil.",
        recipe: "Ingredients: 500g bread flour 10g salt 7g active dry yeast 350ml warm water Instructions: Mix flour and salt. Dissolve yeast in warm water. Combine wet and dry ingredients, knead, and let it rise for 1-2 hours. Shape the dough, rise for 30 minutes, and bake at 425°F (220°C) for 20-25 minutes.",
        country_id: country.id
        )
      user_bread = UserBread.create!( user_id: user.id, bread_id: bread.id )

      expect(user.breads.all.count).to eq(1)
      
      delete "/api/v1/user_breads/#{user_bread.id}", params: { user_id: user.id, bread_id: bread.id }

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body[:message]).to be_a(String)
      expect(response_body[:message]).to eq("Successfully removed bread from your BreadBox")

      expect(user.breads.all.count).to eq(0)
    end
  end
end