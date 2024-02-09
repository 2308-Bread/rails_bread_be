require "rails_helper"

RSpec.describe "Country Serializer" do
  before :each do
    @c1 = Country.create!(name: "Scotland", 
                    overview: "Scotland is a country that is part of the United Kingdom, located in the northern part of the island of Great Britain. It is known for its rich history, stunning landscapes, and vibrant cultural heritage. The capital city is Edinburgh, and major cities include Glasgow and Aberdeen. Scotland has a distinct identity with its own legal and education systems.",
                    culinary: "Scotland's culinary history is characterized by hearty and traditional dishes. Staple foods include haggis, a savory pudding made from sheep's organs, oats, and spices. Scotch whisky, renowned globally, is a significant part of Scottish drinking culture. The cuisine often features locally sourced ingredients such as salmon, venison, and neeps (turnips) and tatties (potatoes).",
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/1200px-Flag_of_Scotland.svg.png")
  end

  it "Takes an object and makes JSON" do
    response = CountrySerializer.new(@c1).as_json

    expect(response).to_not be_instance_of(Country)
    expect(response).to be_a(Hash)
    expect(response["data"]["id"].to_i).to eq(@c1.id)
    expect(response["data"]["attributes"]["name"]).to eq(@c1.name)
    expect(response["data"]["attributes"]["overview"]).to eq(@c1.overview)
    expect(response["data"]["attributes"]["culinary"]).to eq(@c1.culinary)
    expect(response["data"]["attributes"]["imageUrl"]).to eq(@c1.imageUrl)
    expect(response["data"]["relationships"]).to be_a(Hash)
    expect(response["data"]["relationships"]).to have_key("breads")
    expect(response["data"]["relationships"]["breads"]["data"]).to be_a(Array)
  end
end