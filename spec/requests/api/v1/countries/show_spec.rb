require "rails_helper"

RSpec.describe "Countries Show" do
  it "Will retrun only one country" do
    c1 = Country.create!(name: "Scotland", description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")

    get api_v1_country_path(c1.name)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(response_body).to have_key(:country)
    expect(response_body).to have_key(:breads)
    expect(response_body[:country][:data]).to be_a(Hash)
    expect(response_body[:country][:data][:id].to_i).to eq(c1.id)
    expect(response_body[:country][:data][:attributes]).to have_key(:name)
    expect(response_body[:country][:data][:attributes]).to have_key(:description)
    expect(response_body[:country][:data][:attributes][:name]).to eq(c1.name)
    expect(response_body[:country][:data][:attributes][:description]).to eq(c1.description)
    expect(response_body[:country][:data]).to have_key(:relationships)
    expect(response_body[:country][:data][:relationships]).to have_key(:breads)

    expect(response_body[:breads]).to have_key(:data)
    expect(response_body[:breads]).to be_a(Hash)
  end

  it "Will send the country along with it's breads" do
    c1 = Country.create!(name: "Scotland", description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")
    c1.breads << Bread.create!(name: "Scotch Broth Bread", description: "Inspired by traditional Scotch Broth soup, this hearty bread is infused with flavors of lamb, barley, and root vegetables. A rustic and comforting choice.", recipe: "Ingredients: 500g strong white flour 10g salt 7g active dry yeast 300ml lamb broth (cooled) Instructions: In a large bowl, combine flour and salt. Dissolve yeast in lamb broth. Add the liquid to the dry ingredients and knead until smooth. Let it rise for 2 hours. Shape the dough and place it in a greased pan. Allow it to rise for another hour. Bake at 400°F (200°C) for 30-35 minutes.", country_id: c1.id)
    c1.breads << Bread.create!(name: "Highland Oat Bread", description: "A Scottish classic, this oat bread combines the nutty flavor of oats with a touch of honey. It's a dense and wholesome bread, perfect for toasting and enjoying with butter or jam.", recipe: "Ingredients: 400g wholemeal flour 100g oats 10g salt 15g honey 7g active dry yeast 300ml warm water Instructions: Mix oats, flour, and salt. Dissolve yeast in warm water with honey. Combine wet and dry ingredients, knead, and let it rise for 1-2 hours. Shape into a loaf, rise for an additional 30 minutes, and bake at 375°F (190°C) for 25-30 minutes.", country_id: c1.id)
    c1.breads << Bread.create!(name: "Cranachan Swirl Bread", description: "Inspired by the Scottish dessert Cranachan, this swirl bread is filled with raspberries, honey, and toasted oats. A sweet and fruity treat to brighten your day.", recipe: "Ingredients: 500g strong white flour 10g salt 7g active dry yeast 300ml warm milk 50g honey Filling: Raspberries, honey, toasted oats Instructions: Mix flour and salt. Dissolve yeast in warm milk with honey. Knead the dough, let it rise for 1-2 hours. Roll out the dough, spread with honey, raspberries, and oats. Roll into a swirl, rise for 30 minutes, and bake at 375°F (190°C) for 25-30 minutes.", country_id: c1.id)
    c1.breads << Bread.create!(name: "Whisky Barrel Stave Bread", description: "Infused with the smoky essence of whisky barrel staves, this unique bread brings a hint of Scotland's whisky-making tradition to the table. A savory and aromatic delight.", recipe: "Ingredients: 500g bread flour 10g salt 7g active dry yeast 300ml water Soaked whisky barrel staves (finely chopped) Instructions: Mix flour and salt. Dissolve yeast in warm water. Add chopped whisky barrel staves to the dough, knead, and let it rise for 2 hours. Shape the dough, rise for 30 minutes, and bake at 400°F (200°C) for 30-35 minutes.", country_id: c1.id)

    get api_v1_country_path(c1.name)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    expect(response_body).to have_key(:country)
    expect(response_body).to have_key(:breads)
    expect(response_body[:country][:data]).to be_a(Hash)
    expect(response_body[:country][:data][:id].to_i).to eq(c1.id)
    expect(response_body[:country][:data][:attributes]).to have_key(:name)
    expect(response_body[:country][:data][:attributes]).to have_key(:description)
    expect(response_body[:country][:data][:attributes][:name]).to eq(c1.name)
    expect(response_body[:country][:data][:attributes][:description]).to eq(c1.description)
    expect(response_body[:country][:data]).to have_key(:relationships)
    expect(response_body[:country][:data][:relationships]).to have_key(:breads)

    expect(response_body[:breads]).to have_key(:data)
    expect(response_body[:breads][:data]).to be_a(Array)
    expect(response_body[:breads][:data].count).to eq(4)

    response_body[:breads][:data].each do |bread|
      expect(bread[:attributes]).to have_key(:name)
      expect(bread[:attributes]).to have_key(:description)
      expect(bread[:attributes]).to have_key(:recipe)
    end
  end

  describe '#sad-pathing' do
    it 'returns error if not a country' do
      get api_v1_country_path("hjfdkdashjlf")
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      
      expect(response_body).to be_a(Hash)
      expect(response_body[:error]).to eq("Cannot find country with name hjfdkdashjlf")
      expect(response_body[:status]).to eq(404)
    end
  end
end