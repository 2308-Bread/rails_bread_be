require "rails_helper"

RSpec.describe "Country Serializer" do
  before :each do
    @c1 = Country.create!(name: "Scotland", description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")
  end

  it "Takes an object and makes JSON" do
    response = CountrySerializer.new(@c1).as_json

    expect(response).to_not be_instance_of(Country)
    expect(response).to be_a(Hash)
    expect(response["data"]["id"].to_i).to eq(@c1.id)
    expect(response["data"]["attributes"]["name"]).to eq(@c1.name)
    expect(response["data"]["attributes"]["description"]).to eq(@c1.description)
    expect(response["data"]["relationships"]).to be_a(Hash)
    expect(response["data"]["relationships"]).to have_key("breads")
    expect(response["data"]["relationships"]["breads"]["data"]).to be_a(Array)
  end
end