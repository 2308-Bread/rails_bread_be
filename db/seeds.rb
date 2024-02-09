# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


c1 = Country.create!(name: "Scotland", 
# changing to allow for migrations for now
                    description: "Scotland, with its rich culinary heritage, has a diverse and flavorful food tradition that reflects its history and geographical influences. When it comes to bread and food in general, Scotland offers a range of unique and traditional dishes.")
                    # culinary: "")
c2 =Country.create!(name: "Japan", description: "Japan, with its rich culinary heritage, is celebrated for its meticulous preparation, diverse flavors, and a harmonious blend of tradition and innovation. Japanese cuisine, or washoku, is deeply rooted in seasonal ingredients, artistic presentation, and a respect for culinary craftsmanship. Here's a glimpse into Japanese food and bread.")
c3 =Country.create!(name: "Brazil", description: "Pão de queijo is a famous Brazilian cheese bread made with cassava flour and cheese, resulting in a chewy and cheesy delight.")
c4 =Country.create!(name: "France", description: "France is famed for its diverse bread offerings. Baguettes, with their crispy crust and soft interior, are a staple. Pain de campagne (country bread) and pain complet (whole wheat bread) are also popular. Each region has its own specialty, contributing to the rich tapestry of French bread.")
c5 =Country.create!(name: "India", description: "Naan and roti are traditional Indian bread varieties. Naan, leavened and often brushed with ghee, is baked in a tandoor. Roti is unleavened and cooked on a griddle. Paratha, a flaky and stuffed bread, is another popular choice.")
c6 =Country.create!(name: "Italy", description: "Italian bread is diverse and regionally influenced. Ciabatta, with its irregular holes and crisp crust, is popular. Focaccia, a flatbread often topped with herbs and olive oil, hails from Genoa. Grissini, thin and crunchy breadsticks, are another Italian favorite.")

c4.breads << Bread.create!(name: "Baguette",
                           description: "A quintessential French bread, the baguette is characterized by its long, thin shape, crispy golden crust, and soft, airy interior. It is a symbol of French baking and is versatile, perfect for sandwiches or as an accompaniment to meals.",
                           ingredients: ["-500g all-purpose flour", "10g salt", "7g active dry yeast", "350ml warm water"],
                           instructions: ["In a bowl, dissolve yeast in warm water and let it sit for 5 minutes until foamy.", "In a large mixing bowl, combine flour and salt.", "Make a well in the center and pour in the yeast mixture.", "Mix until a dough forms, then knead on a floured surface for about 10 minutes until smooth.", "Place the dough in a lightly oiled bowl, cover with a cloth, and let it rise for 1-2 hours or until doubled in size.", "Punch down the dough, shape it into a baguette, and place on a baking sheet.", "Let it rise for another 30 minutes.", "Preheat the oven to 450°F (230°C).", "Slash the top of the baguette with a sharp knife and bake for 20-25 minutes until golden brown."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Baguette_de_pain%2C_WikiCheese_Lausanne.jpg/120px-Baguette_de_pain%2C_WikiCheese_Lausanne.jpg",
                           country_id: c4.id)
c4.breads << Bread.create!(name: "Pain de Campagne",
                           description: "Translating to 'country bread', pain de campagne is a rustic French loaf made with a mix of flours. It has a chewy crust and a slightly tangy flavor, often enhanced by the addition of a natural sourdough starter.",
                           ingredients: ["400g bread flour", "100g whole wheat flour", "10g salt", "300ml warm water", "100g active sourdough starter"],
                           instructions: ["In a large bowl, combine bread flour, whole wheat flour, and salt.", "Mix warm water and sourdough starter, then add to the dry ingredients.", "Knead the dough for 15-20 minutes until it becomes smooth and elastic.", "Place the dough in a lightly oiled bowl, cover, and let it rise for 3-4 hours or until doubled in size.", "Shape the dough into a round loaf, place on a floured surface, and let it rise for an additional 1-2 hours.", "Preheat the oven to 450°F (230°C).", "Slash the top of the bread and bake for 30-35 minutes until the crust is golden brown."],
                           imageUrl: "https://www.raymondblanc.com/wp-content/uploads/2018/04/Raymond_Blanc_001-1688-1920x1080.jpg",
                           country_id: c4.id)
c4.breads << Bread.create!(name: "Pain  Poilâne",
                           description: "Pain Poilâne is a round, sourdough-style bread with a hearty crust and a distinct wheaty flavor. It's named after the renowned Poilâne bakery in Paris known for its commitment to traditional baking methods.",
                           ingredients: ["500g bread flour", "10g salt", "300ml warm water", "100g active sourdough starter"],
                           instructions: ["Combine bread flour and salt in a large bowl.", "Mix warm water and sourdough starter, then add to the dry ingredients.", "Knead the dough for 15-20 minutes until smooth and elastic.", "Place the dough in a lightly oiled bowl, cover, and let it rise for 4-6 hours or until doubled."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Pain_Po%C3%AElane-_Paris_15e.jpg",
                           country_id: c4.id)
c4.breads << Bread.create!(name: "Pain  Complet",
                           description: "Pain complet, or whole wheat bread, is a wholesome and nutty-flavored French bread made with whole wheat flour. It offers a heartier texture and is a nutritious choice.",
                           ingredients: ["500g whole wheat flour", "10g salt", "7g active dry yeast", "350ml warm water"],
                           instructions: ["Dissolve yeast in warm water and let it sit for 5 minutes until foamy.", "In a large bowl, combine whole wheat flour and salt.", "Make a well and pour in the yeast mixture.", "Mix until a dough forms, then knead on a floured surface for about 10 minutes until smooth.", "Place the dough in a lightly oiled bowl, cover, and let it rise for 1-2 hours or until doubled in size.", "Punch down the dough, shape it into a loaf, and place in a greased pan.", "Let it rise for another 30 minutes.", "Preheat the oven to 400°F (200°C).", "Bake for 25-30 minutes until the bread is golden brown."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Pain_complet.jpg/220px-Pain_complet.jpg",
                           country_id: c4.id)

# Scotland
c1.breads << Bread.create!(name: "Scotch Broth Bread",
                           description: "Inspired by traditional Scotch Broth soup, this hearty bread is infused with flavors of lamb, barley, and root vegetables. A rustic and comforting choice.",
                           ingredients: ["500g strong white flour", "10g salt", "7g active dry yeast", "300ml lamb broth (cooled)"],
                           instructions: ["In a large bowl, combine flour and salt.", "Dissolve yeast in lamb broth.", "Add the liquid to the dry ingredients and knead until smooth.", "Let it rise for 2 hours.", "Shape the dough and place it in a greased pan.", "Allow it to rise for another hour.", "Bake at 400°F (200°C) for 30-35 minutes."],
                           imageUrl: "https://www.frugalmomeh.com/wp-content/uploads/2017/03/scotch-broth-soup.jpg",
                           country_id: c1.id)
c1.breads << Bread.create!(name: "Highland Oat Bread",
                           description: "A Scottish classic, this oat bread combines the nutty flavor of oats with a touch of honey. It's a dense and wholesome bread, perfect for toasting and enjoying with butter or jam.",
                           ingredients: ["400g wholemeal flour", "100g oats", "10g salt", "15g honey", "7g active dry yeast", "300ml warm water"],
                           instructions: ["Mix oats, flour, and salt.", "Dissolve yeast in warm water with honey.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape into a loaf, rise for an additional 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
                           imageUrl: "https://scottishscran.com/wp-content/uploads/2020/10/Scottish-Bannocks-Recipe-038.jpg",
                           country_id: c1.id)
c1.breads << Bread.create!(name: "Cranachan Swirl Bread",
                           description: "Inspired by the Scottish dessert Cranachan, this swirl bread is filled with raspberries, honey, and toasted oats. A sweet and fruity treat to brighten your day.",
                           ingredients: ["500g strong white flour", "10g salt", "7g active dry yeast", "300ml warm milk", "50g honey", "Filling: Raspberries, honey, toasted oats"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm milk with honey.", "Knead the dough, let it rise for 1-2 hours.", "Roll out the dough, spread with honey, raspberries, and oats.", "Roll into a swirl, rise for 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
                           imageUrl: "https://letsdishrecipes.com/wp-content/uploads/2013/12/Cranberry-SWirl-Bread-feature-480x360.jpg",
                           country_id: c1.id)
c1.breads << Bread.create!(name: "Whisky Barrel Stave Bread",
                           description: "Infused with the smoky essence of whisky barrel staves, this unique bread brings a hint of Scotland's whisky-making tradition to the table. A savory and aromatic delight.",
                           ingredients: ["500g bread flour", "10g salt", "7g active dry yeast", "300ml water", "Soaked whisky barrel staves (finely chopped)"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm water.", "Add chopped whisky barrel staves to the dough, knead, and let it rise for 2 hours.", "Shape the dough, rise for 30 minutes, and bake at 400°F (200°C) for 30-35 minutes."],
                           imageUrl: "https://steamykitchen.com/wp-content/uploads/2008/06/no-knead-bread-revisited.jpg",
                           country_id: c1.id)

# Japan
c2.breads << Bread.create!(name: "Sakura Blossom Buns",
                           description: "Inspired by the beauty of cherry blossoms, these buns are filled with a delicate sakura-flavored cream. A delightful and seasonal Japanese treat.",
                           ingredients: ["500g all-purpose flour", "10g sugar", "7g active dry yeast", "250ml warm milk", "Filling: Sakura-flavored cream (whipped cream with sakura essence)"],
                           instructions: ["Mix flour, sugar, and yeast.", "Add warm milk, knead, and let it rise for 1-2 hours.", "Roll out the dough, fill with sakura-flavored cream, shape into buns, rise for 30 minutes, and bake at 375°F (190°C) for 20-25 minutes."],
                           imageUrl: "https://img-global.cpcdn.com/recipes/6631339907350528/680x482cq70/for-cherry-blossom-viewing-picnic-or-as-a-gift-steamed-sakura-buns-recipe-main-photo.jpg",
                           country_id: c2.id)
c2.breads << Bread.create!(name: "Matcha Swirl Bread",
                           description: "This swirl bread features layers of matcha-flavored dough, creating a beautiful and flavorful green swirl. A perfect blend of traditional and modern Japanese flavors.",
                           ingredients: ["400g bread flour", "100g sugar", "7g active dry yeast", "250ml warm milk", "2 tbsp matcha powder"],
                           instructions: ["Mix flour, sugar, and yeast.", "Dissolve matcha powder in warm milk.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Roll out the dough, shape into a swirl, rise for 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
                           imageUrl: "https://images.squarespace-cdn.com/content/v1/60a7f0a88306cd37a2b6e189/1631470109015-B46UNJ85M3VZ90JYV5HZ/Matcha+Swirl+Bread-3.jpg",
                           country_id: c2.id)
c2.breads << Bread.create!(name: "Red Bean Dorayaki Bread",
                           description: "Inspired by the popular Japanese sweet dorayaki, this bread is filled with sweet red bean paste. A delightful combination of soft bread and luscious filling.",
                           ingredients: ["500g all-purpose flour", "10g sugar", "7g active dry yeast", "250ml warm milk", "Filling: Sweet red bean paste"],
                           instructions: ["Mix flour, sugar, and yeast.", "Add warm milk, knead, and let it rise for 1-2 hours.", "Shape the dough, fill with sweet red bean paste, rise for 30 minutes, and bake at 375°F (190°C) for 20-25 minutes."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Dorayaki_001.jpg/640px-Dorayaki_001.jpg",
                           country_id: c2.id)
c2.breads << Bread.create!(name: "Yuzu Citrus Roll",
                           description: "This Japanese-inspired citrus roll is infused with the bright and fragrant flavor of yuzu. A refreshing and tangy bread to enjoy with tea or as a light dessert.",
                           ingredients: ["400g bread flour", "100g sugar", "7g active dry yeast", "250ml warm milk", "Zest and juice of yuzu"],
                           instructions: ["Mix flour, sugar, and yeast.", "Add yuzu zest and juice to warm milk.","Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape into a roll, rise for 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
                           imageUrl: "https://eatlittlebird.com/wp-content/uploads/2022/05/japanese-milk-buns-8.jpg",
                           country_id: c2.id)

# Brazil
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

# France (Continued)
c4.breads << Bread.create!(name: "Pain Comté",
                           description: "Pain Comté is a French bread infused with Comté cheese, creating a rich and savory flavor. It's perfect for pairing with a variety of cheeses or enjoying on its own.",
                           ingredients: ["500g bread flour", "10g salt", "7g active dry yeast", "300ml warm water", "200g Comté cheese (grated)"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm water.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Fold in grated Comté cheese, shape the dough, rise for 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
                           imageUrl: "https://www.toufletboulanger.fr/wp-content/uploads/2018/09/106712-comte.jpg",
                           country_id: c4.id)
c4.breads << Bread.create!(name: "Fougasse",
                           description: "Fougasse is a traditional French flatbread known for its leaf-like shape. It can be flavored with herbs, olives, or other toppings, making it a versatile and visually appealing choice.",
                           ingredients: ["400g bread flour", "100g whole wheat flour","10g salt", "7g active dry yeast", "300ml warm water", "Toppings of choice (e.g., olives, herbs)"],
                           instructions: ["Mix flours and salt.", "Dissolve yeast in warm water.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape into a leaf pattern, add toppings, rise for 30 minutes, and bake at 400°F (200°C) for 25-30 minutes."],
                           imageUrl: "https://www.add1tbsp.com/wp-content/uploads/2021/11/20210328-LaTourangelle-Fougasse1154-scaled.jpg",
                           country_id: c4.id)
c4.breads << Bread.create!(name: "Pain d'Épices",
                           description: "Pain d'Épices, or French spice bread, is a sweet and aromatic loaf made with honey and a blend of spices. It's a delightful treat often enjoyed with tea or as a dessert.",
                           ingredients: ["300g rye flour", "200g all-purpose flour", "200g honey", "250ml milk", "1 tsp baking powder", "1 tsp mixed spice (cinnamon, ginger, nutmeg)"],
                           instructions: ["Mix flours, baking powder, and mixed spice.","Warm honey and milk, add to dry ingredients.", "Mix and let it rise for 1-2 hours.", "Bake in a greased pan at 350°F (180°C) for 40-45 minutes."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Pain_depices_p1050128.jpg/1200px-Pain_depices_p1050128.jpg",
                           country_id: c4.id)
c4.breads << Bread.create!(name: "Pain Viennois",
                           description: "Pain Viennois is a French sweet bread enriched with butter and milk, resulting in a soft and slightly sweet loaf. It's often enjoyed for breakfast or as a snack.",
                           ingredients: ["500g bread flour", "10g sugar", "7g active dry yeast", "250ml warm milk", "100g butter (softened)"],
                           instructions: ["Mix flour, sugar, and yeast.", "Add warm milk and softened butter.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape into a loaf, rise for 30 minutes, and bake at 375°F (190°C) for 25-30 minutes."],
                           imageUrl: "https://img.cuisineaz.com/660x660/2013/12/20/i99070-pain-viennois.jpeg",
                           country_id: c4.id)

# India
c5.breads << Bread.create!(name: "Naan",
                           description: "Naan is a traditional Indian flatbread leavened with yogurt and baked in a tandoor. It's soft, fluffy, and perfect for scooping up delicious curries and dips.",
                           ingredients: ["500g all-purpose flour", "1 tsp baking powder", "1 tsp sugar", "1/2 tsp baking soda", "250ml yogurt", "2 tbsp ghee", "Water (as needed)"],
                           instructions: ["Mix flour, baking powder, sugar, and baking soda.", "Add yogurt and ghee, knead into a soft dough, and let it rise for 2 hours.", "Divide the dough, roll into discs, and bake in a preheated tandoor or oven at 500°F (260°C) for 5-7 minutes."],
                           imageUrl: "https://hips.hearstapps.com/hmg-prod/images/211021-delish-seo-naan-horizontal-0128-eb-1635447725.jpg?crop=0.8896296296296295xw:1xh;center,top&resize=1200:*",
                           country_id: c5.id)
c5.breads << Bread.create!(name: "Roti",
                           description: "Roti is a staple unleavened Indian flatbread made with whole wheat flour. It's simple, versatile, and commonly enjoyed with various curries and vegetables.",
                           ingredients: ["500g whole wheat flour", "Water", "Salt", "Ghee (optional)"],
                           instructions: ["Mix whole wheat flour and salt.", "Add water gradually, knead into a smooth dough.", "Divide into balls, roll into discs, and cook on a hot griddle until puffed and golden.", "Brush with ghee if desired."],
                           imageUrl: "https://atastykitchen.com/wp-content/uploads/2022/08/Roti-500x375.jpg",
                           country_id: c5.id)
c5.breads << Bread.create!(name: "Paratha",
                           description: "Paratha is a flaky and layered Indian bread often stuffed with spiced potatoes, paneer, or other fillings. It's pan-fried to perfection and enjoyed with chutneys or yogurt.",
                           ingredients: ["500g whole wheat flour", "Water", "Salt", "Filling (Aloo Paratha): Boiled and mashed potatoes, Mixed spices (cumin, coriander, chili), Salt, Ghee (for frying)"],
                           instructions: ["Mix flour and salt.", "Knead with water to make a soft dough.", "For filling, mix mashed potatoes with spices.", "Roll out dough, add filling, fold, and roll again.", "Cook on a hot griddle with ghee until golden."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/f/fc/Alooparatha.jpg",
                           country_id: c5.id)
c5.breads << Bread.create!(name: "Bhature",
                           description: "Bhature is a deep-fried Indian bread often paired with spicy chickpea curry (chhole). It's fluffy, crispy, and a popular choice for festive occasions.",
                           ingredients: ["500g all-purpose flour", "250ml yogurt", "1 tsp baking powder", "1/2 tsp baking soda", "Salt", "Ghee (for frying)"],
                           instructions: ["Mix flour, baking powder, baking soda, and salt.", "Add yogurt, knead into a soft dough, and let it rise for 2 hours.", "Divide into balls, roll into discs, and deep-fry until puffed and golden."],
                           imageUrl: "https://upload.wikimedia.org/wikipedia/commons/9/97/Bhatura.jpg",
                           country_id: c5.id)

# Italy
c6.breads << Bread.create!(name: "Ciabatta",
                           description: "Ciabatta is an Italian bread known for its irregular holes, chewy texture, and crisp crust. It's a versatile bread often used for sandwiches or dipping in olive oil.",
                           ingredients: ["500g bread flour", "10g salt", "7g active dry yeast", "350ml warm water"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm water.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape the dough, rise for 30 minutes, and bake at 425°F (220°C) for 20-25 minutes."],
                           imageUrl: "https://i2.wp.com/www.thebrickkitchen.com/wp-content/uploads/2017/05/Easy-Homemade-3-Hour-Ciabatta-The-Brick-Kitchen-2.jpg",
                           country_id: c6.id)
c6.breads << Bread.create!(name: "Focaccia",
                           description: "Focaccia is a flat Italian bread topped with olive oil, herbs, and sometimes vegetables. It has a soft and airy texture, making it a delightful accompaniment to meals.",
                           ingredients: ["500g bread flour", "10g salt", "7g active dry yeast", "350ml warm water", "Toppings: Olive oil, rosemary, cherry tomatoes]"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm water.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape into a pan, press dimples into the dough, drizzle with olive oil, add toppings, and bake at 425°F (220°C) for 20-25 minutes."],
                           imageUrl: "https://alexandracooks.com/wp-content/uploads/2021/09/rosemaryfocacciawhole_alexandraskitchen.jpg",
                           country_id: c6.id)
c6.breads << Bread.create!(name: "Grissini",
                           description: "Grissini are thin and crunchy Italian breadsticks. They are often served as appetizers or alongside antipasti, providing a satisfying crunch with each bite.",
                           ingredients: ["500g bread flour", "10g salt", "7g active dry yeast", "250ml warm water", "Olive oil (for brushing)", "Toppings: Sesame seeds, poppy seeds"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm water.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Roll out the dough, cut into thin strips, and bake at 400°F (200°C) for 12-15 minutes."],
                           imageUrl: "https://www.marcellinaincucina.com/wp-content/uploads/2015/02/grissini-featured.jpg",
                           country_id: c6.id)
c6.breads << Bread.create!(name: "Pane Casareccio",
                           description: "Pane Casareccio is a rustic Italian bread with a thick crust and a chewy crumb. It embodies the traditional and simple essence of Italian baking.",
                           ingredients: ["500g bread flour", "10g salt", "7g active dry yeast", "350ml warm water"],
                           instructions: ["Mix flour and salt.", "Dissolve yeast in warm water.", "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.", "Shape the dough, rise for 30 minutes, and bake at 425°F (220°C) for 25-30 minutes."],
                           imageUrl: "https://i0.wp.com/www.cosiitaliano.com/wp-content/uploads/2015/02/Pane-Casareccio-Enhanced-Cropped-Background-replaced-680x393-@-8.jpg?fit=680%2C393&ssl=1",
                           country_id: c6.id)

user = User.create!(name: "Bradley Baker", email: "dabakingking@baker.com", password_digest: "breaduberalles")


# Stash of country Images 
# Scotland: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/1200px-Flag_of_Scotland.svg.png"
# France: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/255px-Flag_of_France.svg.png"
# Italy: "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/220px-Flag_of_Italy.svg.png"
# Brazil: "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png"
# India: "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1280px-Flag_of_India.svg.png"
# Japan: "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png"

# Stash of bread images
#Scotland
