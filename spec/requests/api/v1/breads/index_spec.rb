require "rails_helper"

RSpec.describe "Breads Index" do
  describe "/api/v1/breads" do
    it "sends a formatted json response of all breads with their attributes" do
      c3 = Country.create!(name: "Brazil",
                          overview: "Brazil, the largest country in South America, is known for its vibrant culture, diverse ecosystems, and passionate people. Famous for the Amazon Rainforest, it boasts a wealth of biodiversity. Rio de Janeiro and São Paulo are bustling cities with iconic landmarks, and Brazil is celebrated for its lively festivals, including Carnival. With a rich blend of indigenous, African, and European influences, Brazil offers a unique fusion of music, dance, and cuisine.",
                          culinary: "Brazil's culinary history is a vibrant tapestry of flavors, influenced by indigenous, African, and Portuguese traditions. Feijoada, a hearty black bean stew with meat, is a national dish symbolizing the cultural blend. Churrasco, or barbecue, showcases Brazil's love for grilled meats, while tropical fruits like açaí and passion fruit contribute to refreshing desserts. The country's diverse regions contribute to a rich gastronomic landscape, making Brazilian cuisine a dynamic and delicious fusion.",
                          imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png")

      c3.breads << Bread.create!(name: "Pão de Queijo",
                                description: "Pão de queijo is a famous Brazilian cheese bread made with cassava flour and cheese, resulting in a chewy and cheesy delight.",
                                ingredients: ["500g tapioca flour", "250ml milk", "125g butter", "10g salt", "2 eggs", "200g grated cheese"],
                                instructions: ["Boil milk with butter and salt.", "Pour over tapioca flour and mix.", "Let it cool, then add eggs and cheese.", "Form small balls and bake at 375°F (190°C) for 15-20 minutes."],
                                imageUrl:"https://www.elmundoeats.com/wp-content/uploads/2023/07/Brazilian-cheese-bread-2.jpg",
                                country_id: c3.id)
      c3.breads << Bread.create!(name: "Beiju",
                                description: "Beiju is a traditional Brazilian flatbread made from tapioca flour. It's thin, crispy, and versatile, often served with sweet or savory toppings.",
                                ingredients: ["Tapioca flour", "Water", "Salt", "Toppings of choice"],
                                instructions: ["Mix tapioca flour with water and a pinch of salt.", "Cook the mixture on a hot griddle until it forms a thin, crispy layer.", "Add your favorite toppings and enjoy!"],
                                imageUrl: "https://www.saborbrasil.it/wp-content/uploads/2021/06/Beiju-de-tapioca-1024x768.jpg",
                                country_id: c3.id)
      c3.breads << Bread.create!(name: "Bolo de Milho",
                                description: "Bolo de milho, or cornbread, is a popular Brazilian treat. It's sweet, moist, and often enjoyed with a cup of coffee or as a dessert.",
                                ingredients: ["250g cornmeal", "250ml milk", "2 eggs", "100g sugar","50g butter", "1 tsp baking powder"],
                                instructions: ["Mix cornmeal, sugar, and baking powder.", "Add eggs, milk, and melted butter."< "Bake in a greased pan at 350°F (180°C) for 30-35 minutes."],
                                imageUrl: "https://www.essenciastudio.com.br/wp-content/uploads/2024/01/bolo-de-milho.jpg",
                                country_id: c3.id)
      c3.breads << Bread.create!(name: "Broa",
                                description: "Broa is a traditional Brazilian cornbread made with a mix of cornmeal and wheat flour. It has a dense texture and is commonly served with savory dishes.",
                                ingredients: ["300g cornmeal", "200g wheat flour", "250ml milk","100g sugar", "50g butter", "1 tsp baking powder"],
                                instructions: ["Mix cornmeal, wheat flour, sugar, and baking powder.", "Add melted butter and milk.", "Bake in a greased pan at 350°F (180°C) for 25-30 minutes."],
                                imageUrl: "https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwb3524f22/images/col/737/7371247-frente.jpg?sw=2000&sh=2000",
                                country_id: c3.id)

      get "/api/v1/breads"
      
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
      expect(bread_response[:data]).to be_a(Array)

      bread_each = bread_response[:data]

      bread_each.each do |bread|
        expect(bread).to have_key(:id)
        expect(bread[:id]).to be_a(String)
        expect(bread).to have_key(:type)
        expect(bread[:type]).to eq("bread")
        expect(bread).to have_key(:attributes)
        expect(bread[:attributes]).to be_a(Hash)
    
        expect(bread[:attributes].keys.count).to eq(5)
        expect(bread[:attributes]).to have_key(:name)
        expect(bread[:attributes][:name]).to be_an(String)

        expect(bread[:attributes]).to have_key(:description)
        expect(bread[:attributes][:description]).to be_a(String)

        expect(bread[:attributes]).to have_key(:ingredients)
        expect(bread[:attributes][:ingredients]).to be_a(Array)

        expect(bread[:attributes]).to have_key(:instructions)
        expect(bread[:attributes][:instructions]).to be_a(Array)

        expect(bread[:attributes]).to have_key(:imageUrl)
        expect(bread[:attributes][:imageUrl]).to be_a(String)
      end
    end
  end
end