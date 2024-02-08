"breads": {
    "data": [
        {
        "id": "9",
        "type": "bread",
        "attributes": {
            "imageUrl": "string of photo url"
            "name": "Sakura Blossom Buns",
            "description": "Inspired by the beauty of cherry blossoms, these buns are filled with a delicate sakura-flavored cream. A delightful and seasonal Japanese treat.",
            "recipe": {
                "Ingredients": ["500g all-purpose flour, 10g sugar, 7g active dry yeast, 250ml warm milk", "Sakura-flavored cream (whipped cream with sakura essence)"]
                "Instructions": [ "Mix flour, sugar, and yeast.", "Add warm milk, knead, and let it rise for 1-2 hours.", "Roll out the dough", "Fill with sakura-flavored cream", "shape into buns", "rise for 30 minutes", "and bake at 375°F (190°C) for 20-25 minutes."]
            } 
        },
        "relationships": {
            "country": {
                "data": {
                    "id": "2",
                    "type": "country"
                }
            }
        }
    },



    "country": {
        "data": {
            "id": "2",
            "type": "country",
            "attributes": {
                "imageUrl": "string of photo url"
                "name": "Japan",
                "description": {
                    "overview": "Talk about country as a whole",
                    "culinary": "Talks about food culture"
                } "Japan, with its rich culinary heritage, is celebrated for its meticulous preparation, diverse flavors, and a harmonious blend of tradition and innovation. Japanese cuisine, or washoku, is deeply rooted in seasonal ingredients, artistic presentation, and a respect for culinary craftsmanship. Here's a glimpse into Japanese food and bread."
            },