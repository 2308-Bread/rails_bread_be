require "rails_helper"

RSpec.describe "Countries Index" do
  it 'Will return all countries' do
    c1 = Country.create!(name: "Scotland", 
        overview: "Scotland is a country that is part of the United Kingdom, located in the northern part of the island of Great Britain. It is known for its rich history, stunning landscapes, and vibrant cultural heritage. The capital city is Edinburgh, and major cities include Glasgow and Aberdeen. Scotland has a distinct identity with its own legal and education systems.",
        culinary: "Scotland's culinary history is characterized by hearty and traditional dishes. Staple foods include haggis, a savory pudding made from sheep's organs, oats, and spices. Scotch whisky, renowned globally, is a significant part of Scottish drinking culture. The cuisine often features locally sourced ingredients such as salmon, venison, and neeps (turnips) and tatties (potatoes).",
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/1200px-Flag_of_Scotland.svg.png")
    c2 =Country.create!(name: "Japan", 
        overview: "Japan, an island nation in East Asia, boasts a rich blend of ancient traditions and cutting-edge modernity. Renowned for its iconic cherry blossoms, Japan has a diverse landscape featuring mountains, forests, and vibrant cities. Tokyo, the capital, is a bustling metropolis with advanced technology and cultural landmarks. Japanese culture is celebrated globally through its cuisine, martial arts, traditional arts like tea ceremonies, and a strong emphasis on respect and harmony.",
        culinary: "Japan's culinary history is steeped in precision and artistry, reflected in its world-famous cuisine. Sushi, sashimi, and ramen are iconic Japanese dishes known for their delicate flavors and meticulous preparation. Washoku, the traditional Japanese meal, emphasizes seasonal and regional ingredients. Japan's culinary heritage also includes tea ceremonies, kaiseki multi-course dining, and a deep appreciation for fresh, high-quality ingredients.",
        imageUrl:"https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png")
    c3 =Country.create!(name: "Brazil",
        overview: "Brazil, the largest country in South America, is known for its vibrant culture, diverse ecosystems, and passionate people. Famous for the Amazon Rainforest, it boasts a wealth of biodiversity. Rio de Janeiro and São Paulo are bustling cities with iconic landmarks, and Brazil is celebrated for its lively festivals, including Carnival. With a rich blend of indigenous, African, and European influences, Brazil offers a unique fusion of music, dance, and cuisine.",
        culinary: "Brazil's culinary history is a vibrant tapestry of flavors, influenced by indigenous, African, and Portuguese traditions. Feijoada, a hearty black bean stew with meat, is a national dish symbolizing the cultural blend. Churrasco, or barbecue, showcases Brazil's love for grilled meats, while tropical fruits like açaí and passion fruit contribute to refreshing desserts. The country's diverse regions contribute to a rich gastronomic landscape, making Brazilian cuisine a dynamic and delicious fusion.",
        imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png")
    c4 =Country.create!(name: "France",
        overview: "France, located in Western Europe, is renowned for its exquisite art, culture, and cuisine. Paris, the capital city, is a global center for fashion, gastronomy, and iconic landmarks like the Eiffel Tower. The country has a rich historical heritage, from the Renaissance to the Enlightenment. French culture is celebrated for its contributions to philosophy, literature, and the culinary arts.",
        culinary: "France's culinary history is a cornerstone of global gastronomy, marked by precision and artistry. Renowned for its diverse regional specialties, French cuisine includes classics like coq au vin, bouillabaisse, and ratatouille. The country's patisseries showcase exquisite pastries like croissants and éclairs. French culinary traditions emphasize fresh, high-quality ingredients, and the influence of French chefs has shaped culinary standards worldwide.",
        imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/255px-Flag_of_France.svg.png")
    c5 =Country.create!(name: "India",
        overview: "India, located in South Asia, is a country of vast diversity, encompassing various cultures, languages, and landscapes. With a rich history dating back millennia, it is known for its architectural marvels like the Taj Mahal. India's cultural tapestry includes vibrant festivals, classical dance forms, and diverse cuisines reflecting regional flavors. A hub of spirituality, innovation, and tradition, India continues to captivate with its dynamic blend of ancient heritage and modern development.",
        culinary: "India's culinary history is a tapestry of flavors, spices, and regional diversity. Influenced by centuries of trade and cultural exchanges, Indian cuisine offers a rich array of dishes, including biryani, curry, and dosa. The use of aromatic spices like cardamom, cumin, and coriander is a hallmark of Indian cooking. Street food culture thrives, showcasing delights like chaat and samosas, making Indian cuisine a globally celebrated and dynamic culinary experience.",
        imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1280px-Flag_of_India.svg.png")
    c6 =Country.create!(name: "Italy",
        overview: "Italy, situated in Southern Europe, is renowned for its rich cultural heritage, historical landmarks, and exquisite art. The birthplace of the Renaissance, Italy boasts iconic cities like Rome, Florence, and Venice. Famous for its delectable cuisine, including pasta, pizza, and gelato, Italian food is characterized by fresh, high-quality ingredients. The Mediterranean nation captivates with its stunning landscapes, from the rolling hills of Tuscany to the picturesque Amalfi Coast.",
        culinary: "Italy's culinary history is a gastronomic journey marked by passion and regional diversity. Pasta, a staple, takes various forms across the country, paired with diverse sauces like Bolognese and pesto. Italian cuisine emphasizes fresh, locally sourced ingredients, seen in dishes such as risotto and bruschetta. Renowned for its wines, cheeses, and iconic desserts like tiramisu, Italy's culinary heritage is a blend of tradition, innovation, and a deep appreciation for flavors.",
        imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/220px-Flag_of_Italy.svg.png")


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
      expect(country[:attributes]).to have_key(:overview)
      expect(country[:attributes][:overview]).to be_a(String)
      expect(country[:attributes]).to have_key(:culinary)
      expect(country[:attributes][:culinary]).to be_a(String)
      expect(country[:attributes]).to have_key(:imageUrl)
      expect(country[:attributes][:imageUrl]).to be_a(String)
    end
  end
end