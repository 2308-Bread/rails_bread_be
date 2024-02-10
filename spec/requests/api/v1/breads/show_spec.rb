require "rails_helper"

RSpec.describe "Breads Show" do
  describe "/api/v1/breads/:id" do
    it "sends a formatted json response of a specific bread and its attributes" do
      c1 = Country.create!(name: "Scotland", 
                    overview: "Scotland is a country that is part of the United Kingdom, located in the northern part of the island of Great Britain. It is known for its rich history, stunning landscapes, and vibrant cultural heritage. The capital city is Edinburgh, and major cities include Glasgow and Aberdeen. Scotland has a distinct identity with its own legal and education systems.",
                    culinary: "Scotland's culinary history is characterized by hearty and traditional dishes. Staple foods include haggis, a savory pudding made from sheep's organs, oats, and spices. Scotch whisky, renowned globally, is a significant part of Scottish drinking culture. The cuisine often features locally sourced ingredients such as salmon, venison, and neeps (turnips) and tatties (potatoes).",
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/1200px-Flag_of_Scotland.svg.png")

      bread = c1.breads.create!(
        name: "Sourdough",
        description: "Ooooo, this bread is sour",
        ingredients: ["Flour", "Salt", "Water"],
        instructions: ["Mix sour and bread stuff", "Bake it", "Brother you got bread."],
        imageUrl: "sourdough"
        )

      get "/api/v1/breads/#{bread.name}"
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      single_bread = Bread.last
    
      expect(single_bread[:id]).to eq(single_bread.id)
      expect(single_bread[:name]).to eq(single_bread.name)
      expect(single_bread[:description]).to eq(single_bread.description)
      expect(single_bread[:ingredients]).to eq(single_bread.ingredients)
      expect(single_bread[:instructions]).to eq(single_bread.instructions)
      expect(single_bread[:imageUrl]).to eq(single_bread.imageUrl)
      expect(single_bread[:country_id]).to eq(single_bread.country.id)
      
      bread_response = JSON.parse(response.body, symbolize_names: true)

      expect(bread_response).to be_a(Hash)
      expect(bread_response[:data]).to be_a(Hash)
      expect(bread_response[:data][:id]).to eq("#{bread.id}")
      expect(bread_response[:data][:type]).to eq("bread")
      expect(bread_response[:data][:attributes]).to be_a(Hash)
      expect(bread_response)
      
      bread_reach = bread_response[:data][:attributes]
      
      expect(bread_reach.keys.count).to eq(5)
      expect(bread_reach).to have_key(:name)
      expect(bread_reach[:name]).to be_an(String)
      expect(bread_reach[:name]).to eq("#{bread.name}")

      expect(bread_reach).to have_key(:description)
      expect(bread_reach[:description]).to be_a(String)
      expect(bread_reach[:description]).to eq("#{bread.description}")

      expect(bread_reach).to have_key(:ingredients)
      expect(bread_reach[:ingredients]).to be_a(Array)
      expect(bread_reach[:ingredients]).to eq(bread.ingredients)

      expect(bread_reach).to have_key(:instructions)
      expect(bread_reach[:instructions]).to be_a(Array)
      expect(bread_reach[:instructions]).to eq(bread.instructions)

      expect(bread_reach).to have_key(:imageUrl)
      expect(bread_reach[:imageUrl]).to be_a(String)
      expect(bread_reach[:imageUrl]).to eq("#{bread.imageUrl}")
    end
  end
end