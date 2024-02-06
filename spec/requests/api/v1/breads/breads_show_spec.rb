require "rails_helper"

RSpec.describe "Breads API endpoints" do
  describe "/api/v1/breads/:id" do
    it "sends a formatted json response of a specific bread and its attributes" do
      country = Country.create!(name: "France", description: "France is famous for breads of many forms")

      bread = country.breads.create!(
        name: "Sourdough",
        description: "Ooooo, this bread is sour",
        recipe: "Mix sour and bread stuff and then bake it"
        )

      get "/api/v1/breads/#{bread.name}"
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      single_bread = Bread.last
    
      expect(single_bread[:id]).to eq(single_bread.id)
      expect(single_bread[:name]).to eq(single_bread.name)
      expect(single_bread[:description]).to eq(single_bread.description)
      expect(single_bread[:recipe]).to eq(single_bread.recipe)
      expect(single_bread[:country_id]).to eq(single_bread.country.id)
      
      bread_response = JSON.parse(response.body, symbolize_names: true)

      expect(bread_response).to be_a(Hash)
      expect(bread_response[:data]).to be_a(Hash)
      expect(bread_response[:data][:id]).to eq("#{bread.id}")
      expect(bread_response[:data][:type]).to eq("bread")
      expect(bread_response[:data][:attributes]).to be_a(Hash)
      expect(bread_response)
      
      bread_reach = bread_response[:data][:attributes]
      
      expect(bread_reach.keys.count).to eq(3)
      expect(bread_reach).to have_key(:name)
      expect(bread_reach[:name]).to be_an(String)
      expect(bread_reach[:name]).to eq("#{bread.name}")

      expect(bread_reach).to have_key(:description)
      expect(bread_reach[:description]).to be_a(String)
      expect(bread_reach[:description]).to eq("#{bread.description}")

      expect(bread_reach).to have_key(:recipe)
      expect(bread_reach[:recipe]).to be_a(String)
      expect(bread_reach[:recipe]).to eq("#{bread.recipe}")
    end
  end
end