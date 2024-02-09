require "rails_helper"

RSpec.describe "Bread Serializer" do
  before(:each) do
    @c1 = Country.create!(name: "Scotland", 
                    overview: "Scotland is a country that is part of the United Kingdom, located in the northern part of the island of Great Britain. It is known for its rich history, stunning landscapes, and vibrant cultural heritage. The capital city is Edinburgh, and major cities include Glasgow and Aberdeen. Scotland has a distinct identity with its own legal and education systems.",
                    culinary: "Scotland's culinary history is characterized by hearty and traditional dishes. Staple foods include haggis, a savory pudding made from sheep's organs, oats, and spices. Scotch whisky, renowned globally, is a significant part of Scottish drinking culture. The cuisine often features locally sourced ingredients such as salmon, venison, and neeps (turnips) and tatties (potatoes).",
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/1200px-Flag_of_Scotland.svg.png")
    @b1 = Bread.create!(name: "Highland Oat Bread",
    description: "A Scottish classic, this oat bread combines the nutty flavor of oats with a touch of honey. It's a dense and wholesome bread, perfect for toasting and enjoying with butter or jam.",
    ingredients: ["400g wholemeal flour", "100g oats", "10g salt", "15g honey", "7g active dry yeast", "300ml warm water"],
    instructions: ["Mix oats, flour, and salt.", "Dissolve yeast in warm water with honey.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape into a loaf, rise for an additional 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
    imageUrl: "https://scottishscran.com/wp-content/uploads/2020/10/Scottish-Bannocks-Recipe-038.jpg",
    country_id: @c1.id)
  end

  it "Takes an object and makes json" do
    response = BreadSerializer.new(@b1).as_json

    expect(response).to_not be_instance_of(Country)
    expect(response).to be_a(Hash)
    expect(response["data"]["id"].to_i).to eq(@b1.id)
    expect(response["data"]["attributes"]["name"]).to eq(@b1.name)
    expect(response["data"]["attributes"]["description"]).to eq(@b1.description)
    expect(response["data"]["relationships"]).to be_a(Hash)
    expect(response["data"]["relationships"]).to have_key("country")
    expect(response["data"]["relationships"]["country"]["data"]).to be_a(Hash)
    expect(response["data"]["relationships"]["country"]["data"]).to have_key("id")
    expect(response["data"]["relationships"]["country"]["data"]).to have_key("type")
  end
end