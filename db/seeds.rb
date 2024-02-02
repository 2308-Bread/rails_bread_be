# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


c1 = Country.create(name: "Scotland", description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")
c2 =Country.create(name: "Japan", description: "Japan, with its rich culinary heritage, is celebrated for its meticulous preparation, diverse flavors, and a harmonious blend of tradition and innovation. Japanese cuisine, or washoku, is deeply rooted in seasonal ingredients, artistic presentation, and a respect for culinary craftsmanship. Here's a glimpse into Japanese food and bread.")
c3 =Country.create(name: "Brazil", description: "Pão de queijo is a famous Brazilian cheese bread made with cassava flour and cheese, resulting in a chewy and cheesy delight.")
c4 =Country.create(name: "France", description: "France is famed for its diverse bread offerings. Baguettes, with their crispy crust and soft interior, are a staple. Pain de campagne (country bread) and pain complet (whole wheat bread) are also popular. Each region has its own specialty, contributing to the rich tapestry of French bread.")
c5 =Country.create(name: "India", description: "Naan and roti are traditional Indian bread varieties. Naan, leavened and often brushed with ghee, is baked in a tandoor. Roti is unleavened and cooked on a griddle. Paratha, a flaky and stuffed bread, is another popular choice.")
c6 =Country.create(name: "Italy", description: "Italian bread is diverse and regionally influenced. Ciabatta, with its irregular holes and crisp crust, is popular. Focaccia, a flatbread often topped with herbs and olive oil, hails from Genoa. Grissini, thin and crunchy breadsticks, are another Italian favorite.")

b1 = Bread.create(name: "Baguette", description: "A quintessential French bread, the baguette is characterized by its long, thin shape, crispy golden crust, and soft, airy interior. It is a symbol of French baking and is versatile, perfect for sandwiches or as an accompaniment to meals.", recipe: "Ingredients: -500g all-purpose flour 10g salt 7g active dry yeast 350ml warm water Instructions: In a bowl, dissolve yeast in warm water and let it sit for 5 minutes until foamy. In a large mixing bowl, combine flour and salt. Make a well in the center and pour in the yeast mixture. Mix until a dough forms, then knead on a floured surface for about 10 minutes until smooth. Place the dough in a lightly oiled bowl, cover with a cloth, and let it rise for 1-2 hours or until doubled in size. Punch down the dough, shape it into a baguette, and place on a baking sheet. Let it rise for another 30 minutes. Preheat the oven to 450°F (230°C). Slash the top of the baguette with a sharp knife and bake for 20-25 minutes until golden brown.", countries_id: 4)
