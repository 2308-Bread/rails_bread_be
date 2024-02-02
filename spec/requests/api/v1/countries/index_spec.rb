require "rails_helper"

RSpec.describe "Countries Index" do
  it 'Will return all countries' do
    c1 = Country.create!(name: "Scotland", description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")
    c2 =Country.create!(name: "Japan", description: "Japan, with its rich culinary heritage, is celebrated for its meticulous preparation, diverse flavors, and a harmonious blend of tradition and innovation. Japanese cuisine, or washoku, is deeply rooted in seasonal ingredients, artistic presentation, and a respect for culinary craftsmanship. Here's a glimpse into Japanese food and bread.")
    c3 =Country.create!(name: "Brazil", description: "Pão de queijo is a famous Brazilian cheese bread made with cassava flour and cheese, resulting in a chewy and cheesy delight.")
    c4 =Country.create!(name: "France", description: "France is famed for its diverse bread offerings. Baguettes, with their crispy crust and soft interior, are a staple. Pain de campagne (country bread) and pain complet (whole wheat bread) are also popular. Each region has its own specialty, contributing to the rich tapestry of French bread.")
    c5 =Country.create!(name: "India", description: "Naan and roti are traditional Indian bread varieties. Naan, leavened and often brushed with ghee, is baked in a tandoor. Roti is unleavened and cooked on a griddle. Paratha, a flaky and stuffed bread, is another popular choice.")
    c6 =Country.create!(name: "Italy", description: "Italian bread is diverse and regionally influenced. Ciabatta, with its irregular holes and crisp crust, is popular. Focaccia, a flatbread often topped with herbs and olive oil, hails from Genoa. Grissini, thin and crunchy breadsticks, are another Italian favorite.")


    get api_v1_countries_path
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(response_body[:data]).to be_a(Array)
    expect(response_body[:data].count).to eq(6)

    response_body[:data].each do |country|
      expect(country).to have_key(:id)
      expect(country).to have_key(:type)
      expect(country).to have_key(:attributes)
      expect(country[:attributes]).to be_a(Hash)
      expect(country[:attributes]).to have_key(:name)
      expect(country[:attributes][:name]).to be_a(String)
      expect(country[:attributes]).to have_key(:description)
      expect(country[:attributes][:description]).to be_a(String)
    end
  end
end