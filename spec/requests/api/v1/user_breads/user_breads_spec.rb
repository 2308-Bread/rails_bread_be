require "rails_helper"

RSpec.describe 'UserBreads API endpoints' do
  describe "Post /api/v1/user_breads" do
    it "creates a new association between an existing bread and user in the user breads
    and can show the bread in the specific user's breads get request" do
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

      get "/api/v1/users/#{user.id}/breads"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user_bread = country.breads.last

      expect(user_bread[:name]).to eq(user_bread.name)
      expect(user_bread[:name]).to eq(user_bread.name)
      expect(user_bread[:description]).to eq(user_bread.description)
      expect(user_bread[:recipe]).to eq(user_bread.recipe)
      expect(user_bread[:country_id]).to eq(user_bread.country.id)

      
    end
  end
end