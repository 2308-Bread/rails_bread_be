require "rails_helper"

RSpec.describe "Countries Show" do
  it "Will retrun only one country" do
    c1 = Country.create!(name: "Scotland", description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")

    get api_v1_country_path(c1)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(response_body[:data]).to be_a(Hash)
    expect(response_body[:data][:id].to_i).to eq(c1.id)
    expect(response_body[:data][:attributes]).to have_key(:name)
    expect(response_body[:data][:attributes]).to have_key(:description)
    expect(response_body[:data][:attributes][:name]).to eq(c1.name)
    expect(response_body[:data][:attributes][:description]).to eq(c1.description)

    expect(response_body[:data]).to have_key(:relationships)
    expect(response_body[:data][:relationships]).to have_key(:breads)
  end

  describe '#sad-pathing' do
    it 'returns error if not a country' do
      get api_v1_country_path(1)
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      expect(response_body).to be_a(Hash)
      expect(response_body[:error_object][:message]).to eq("Couldn't find Country with 'id'=1")
      expect(response_body[:error_object][:status]).to eq(404)
    end
  end
end