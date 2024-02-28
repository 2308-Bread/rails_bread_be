# La Boulangerie
Created by: 
- [Eric Belongea](https://www.linkedin.com/in/eric-belongea/) | [GitHub](https://github.com/EricBelongea)
- [Clay O'Leary](https://www.linkedin.com/in/john-clay-oleary/) | [GitHub](https://github.com/Captainlearyo)
- [Cory Powell](https://www.linkedin.com/in/coryrpow/) | [GitHub](https://github.com/coryrpow)
- [Bobby Steckline](https://www.linkedin.com/in/rsteckline/) | [GitHub](https://github.com/rsteckline)
- [Deanna Stevens](https://www.linkedin.com/in/deanna-sofia-stevens/) | [GitHub](https://github.com/dsstevens)
## Directory
- [Overview](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#overview)
- [Getting Started](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#getting-started)
- [Built With](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#built-with)
- [Testing](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#testing)
- [Gems and Testing ](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#gems-and-testing)
- [API Endpoints](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#api-endpoints)
  - [All Countries](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#all-countries)
  - [Specific Country Details and Associated Breads](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#specific-country-details-and-associated-breads-pass-the-endpoint-a-country-name)
  - [All Breads](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#all-breads)
  - [Specific Bread Details](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#specific-bread-details-pass-the-endpoint-a-bread-name)
  - [All Users](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#all-users)
  - [Specific Users Details](https://github.com/2308-Bread/rails_bread_be?tab=readme-ov-file#specific-users-details-pass-the-endpoint-a-user-id)
  
## Overview

This is an API Repository built in Ruby with a Rails framework and deployed on Heroku.

Using this API will allow you to get traditional breads that originate from each country around the world. While we here at "le Belongea Boulangerie" care about home made bread; more countries, more breads, more recipes coming soon. 
### Want to see the other Repos?

<u> C# && .NET </u>
  - [.NET Repo](https://github.com/2308-Bread/dotnet-bread-be)
  - [Frontend Repo](https://github.com/2308-Bread/dotnet-bread-fe)
  - [Deployed Site](https://dotnet-laboulangerie.vercel.app/)

<br>

<u> Ruby on Rails </u>
  - [Rails Repo](https://github.com/2308-Bread/rails_bread_be)
  - [Frontend Repo](https://github.com/2308-Bread/rails_bread_fe)
  - [Deployed Site](https://laboulangerie.vercel.app/)

<br>

<u>Furture Features</u>
 - [GitHub Projects Boards](https://github.com/orgs/2308-Bread/projects/1/views/1)
 
## Getting Started

Ensure that you have [Ruby 3.1.4](https://github.com/ruby/ruby) && [Rails 7.0.8](https://github.com/rails/rails) installed.

Fork and/or Clone this Repo

Once on your local, `bundle install`.

In your terminal:
- Run `bundle exec rspec` to make sure all of your tests are passing.
- `rails db:{drop,create,seed,migrate}`

## Built With
![CircleCI](https://img.shields.io/badge/circle%20ci-%23161616.svg?style=for-the-badge&logo=circleci&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)



## Testing
- `bundle exec rspec` will run all of the tests at once 
- For the SimpleCov coverage report in the terminal run `open coverage/index.html`

- If you want to run only a specific file use the following syntax: `bundle exec rspec spec/facades/geolocation_facade_spec.rb`
  -  Add `:11` to the end of the previous line if you only want to run the test starting on line 11. 


<br>

## Gems and Testing 
<!-- - [Faraday](https://github.com/lostisland/faraday) gem to interact with APIs -->
- [JSONAPI Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) gem for formatting JSON responses
- [Pry](https://github.com/pry/pry) gem for debugging
- [Rspec-Rails](https://github.com/rspec/rspec-rails) Base of all testing in this Repo
- [Launchy](https://github.com/copiousfreetime/launchy) gem for inspection and debugging
- [Capybara](https://github.com/morris-lab/Capybara) gem for end to end testing 
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) gem for testing assertions
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem for code coverage tracking
- [factory_bot](https://github.com/thoughtbot/factory_bot) gem to create models for testing data
- [Faker](https://github.com/faker-ruby/faker) gem to mock and stub test data

- [Postman](https://www.postman.com/) to check API endpoints

<br>

## API Endpoints


Note: You must have the Rails Server running in order for calls using localhost to work in Postman. In a terminal inside of the repo, enter `rails s` to spin up the server.
Utilize `"http://localhost:3000"` to access ALL endpoints. 
### Endpoint Details


#### All Countries

`GET /api/v1/countries`

**Example response:**
    
```
{
    "data": [
        {
            "id": "1",
            "type": "country",
            "attributes": {
                "name": "Scotland",
                "overview": "Scotland is a country that is part of the United Kingdom, located in the northern part of the island of Great Britain. It is known for its rich history, stunning landscapes, and vibrant cultural heritage. The capital city is Edinburgh, and major cities include Glasgow and Aberdeen. Scotland has a distinct identity with its own legal and education systems.",
                "culinary": "Scotland's culinary history is characterized by hearty and traditional dishes. Staple foods include haggis, a savory pudding made from sheep's organs, oats, and spices. Scotch whisky, renowned globally, is a significant part of Scottish drinking culture. The cuisine often features locally sourced ingredients such as salmon, venison, and neeps (turnips) and tatties (potatoes).",
                "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/1200px-Flag_of_Scotland.svg.png"
            },
            "relationships": {
                "breads": {
                    "data": [
                        {
                            "id": "5",
                            "type": "bread"
                        },
                        {
                            "id": "6",
                            "type": "bread"
                        },
                        {
                            "id": "7",
                            "type": "bread"
                        },
                        {
                            "id": "8",
                            "type": "bread"
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "country",
            "attributes": {
                "name": "Japan",
                "overview": "Japan, an island nation in East Asia, boasts a rich blend of ancient traditions and cutting-edge modernity. Renowned for its iconic cherry blossoms, Japan has a diverse landscape featuring mountains, forests, and vibrant cities. Tokyo, the capital, is a bustling metropolis with advanced technology and cultural landmarks. Japanese culture is celebrated globally through its cuisine, martial arts, traditional arts like tea ceremonies, and a strong emphasis on respect and harmony.",
                "culinary": "Japan's culinary history is steeped in precision and artistry, reflected in its world-famous cuisine. Sushi, sashimi, and ramen are iconic Japanese dishes known for their delicate flavors and meticulous preparation. Washoku, the traditional Japanese meal, emphasizes seasonal and regional ingredients. Japan's culinary heritage also includes tea ceremonies, kaiseki multi-course dining, and a deep appreciation for fresh, high-quality ingredients.",
                "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png"
            },
            "relationships": {
                "breads": {
                    "data": [
                        {
                            "id": "9",
                            "type": "bread"
                        },
                        {
                            "id": "10",
                            "type": "bread"
                        },
                        {
                            "id": "11",
                            "type": "bread"
                        },
                        {
                            "id": "12",
                            "type": "bread"
                        }
                    ]
                }
            }
        }, 
        continued...
    ]
}
```
___
#### Specific Country Details and Associated Breads (pass the endpoint a country name)
  
`GET /api/v1/countries/:country_name`

**Example response:**
```
{
    "country": {
        "data": {
            "id": 6,
            "attributes": {
                "name": "Italy",
                "overview": "Italy, situated in Southern Europe, is renowned for its rich cultural heritage, historical landmarks, and exquisite art. The birthplace of the Renaissance, Italy boasts iconic cities like Rome, Florence, and Venice. Famous for its delectable cuisine, including pasta, pizza, and gelato, Italian food is characterized by fresh, high-quality ingredients. The Mediterranean nation captivates with its stunning landscapes, from the rolling hills of Tuscany to the picturesque Amalfi Coast.",
                "culinary": "Italy's culinary history is a gastronomic journey marked by passion and regional diversity. Pasta, a staple, takes various forms across the country, paired with diverse sauces like Bolognese and pesto. Italian cuisine emphasizes fresh, locally sourced ingredients, seen in dishes such as risotto and bruschetta. Renowned for its wines, cheeses, and iconic desserts like tiramisu, Italy's culinary heritage is a blend of tradition, innovation, and a deep appreciation for flavors.",
                "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/220px-Flag_of_Italy.svg.png"
            }
        }
    },
    "breads": {
        "data": [
            {
                "id": 25,
                "attributes": {
                    "name": "Ciabatta",
                    "description": "Ciabatta is an Italian bread known for its irregular holes, chewy texture, and crisp crust. It's a versatile bread often used for sandwiches or dipping in olive oil.",
                    "imageUrl": "https://i2.wp.com/www.thebrickkitchen.com/wp-content/uploads/2017/05/Easy-Homemade-3-Hour-Ciabatta-The-Brick-Kitchen-2.jpg",
                    "recipe": {
                        "ingredients": [
                            "500g bread flour",
                            "10g salt",
                            "7g active dry yeast",
                            "350ml warm water"
                        ],
                        "instructions": [
                            "Mix flour and salt.",
                            "Dissolve yeast in warm water.",
                            "Combine wet and dry ingredients, knead, and let it rise for 1-2 hours.",
                            "Shape the dough, rise for 30 minutes, and bake at 425°F (220°C) for 20-25 minutes."
                        ]
                    }
                }
            }
                ]
              },
              continued...
}
```
___
#### All Breads

`GET /api/v1/breads`
**Example response:**
```
{
    "data": [
        {
            "id": "1",
            "type": "bread",
            "attributes": {
                "name": "Baguette",
                "description": "A quintessential French bread, the baguette is characterized by its long, thin shape, crispy golden crust, and soft, airy interior. It is a symbol of French baking and is versatile, perfect for sandwiches or as an accompaniment to meals.",
                "ingredients": [
                    "-500g all-purpose flour",
                    "10g salt",
                    "7g active dry yeast",
                    "350ml warm water"
                ],
                "instructions": [
                    "In a bowl, dissolve yeast in warm water and let it sit for 5 minutes until foamy.",
                    "In a large mixing bowl, combine flour and salt.",
                    "Make a well in the center and pour in the yeast mixture.",
                    "Mix until a dough forms, then knead on a floured surface for about 10 minutes until smooth.",
                    "Place the dough in a lightly oiled bowl, cover with a cloth, and let it rise for 1-2 hours or until doubled in size.",
                    "Punch down the dough, shape it into a baguette, and place on a baking sheet.",
                    "Let it rise for another 30 minutes.",
                    "Preheat the oven to 450°F (230°C).",
                    "Slash the top of the baguette with a sharp knife and bake for 20-25 minutes until golden brown."
                ],
                "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Baguette_de_pain%2C_WikiCheese_Lausanne.jpg/120px-Baguette_de_pain%2C_WikiCheese_Lausanne.jpg"
            },
            "relationships": {
                "country": {
                    "data": {
                        "id": "4",
                        "type": "country"
                    }
                }
            }
        },
        {
            "id": "2",
            "type": "bread",
            "attributes": {
                "name": "Pain de Campagne",
                "description": "Translating to 'country bread', pain de campagne is a rustic French loaf made with a mix of flours. It has a chewy crust and a slightly tangy flavor, often enhanced by the addition of a natural sourdough starter.",
                "ingredients": [
                    "400g bread flour",
                    "100g whole wheat flour",
                    "10g salt",
                    "300ml warm water",
                    "100g active sourdough starter"
                ],
                "instructions": [
                    "In a large bowl, combine bread flour, whole wheat flour, and salt.",
                    "Mix warm water and sourdough starter, then add to the dry ingredients.",
                    "Knead the dough for 15-20 minutes until it becomes smooth and elastic.",
                    "Place the dough in a lightly oiled bowl, cover, and let it rise for 3-4 hours or until doubled in size.",
                    "Shape the dough into a round loaf, place on a floured surface, and let it rise for an additional 1-2 hours.",
                    "Preheat the oven to 450°F (230°C).",
                    "Slash the top of the bread and bake for 30-35 minutes until the crust is golden brown."
                ],
                "imageUrl": "https://www.raymondblanc.com/wp-content/uploads/2018/04/Raymond_Blanc_001-1688-1920x1080.jpg"
            },
            "relationships": {
                "country": {
                    "data": {
                        "id": "4",
                        "type": "country"
                    }
                }
            }
        },
        continued...
    ]
}
```
___
#### Specific Bread Details (pass the endpoint a bread name)

`GET /api/v1/breads/:bread_name`
**Example response:**
```
{
    "data": {
        "id": "1",
        "type": "bread",
        "attributes": {
            "name": "Baguette",
            "description": "A quintessential French bread, the baguette is characterized by its long, thin shape, crispy golden crust, and soft, airy interior. It is a symbol of French baking and is versatile, perfect for sandwiches or as an accompaniment to meals.",
            "ingredients": [
                "-500g all-purpose flour",
                "10g salt",
                "7g active dry yeast",
                "350ml warm water"
            ],
            "instructions": [
                "In a bowl, dissolve yeast in warm water and let it sit for 5 minutes until foamy.",
                "In a large mixing bowl, combine flour and salt.",
                "Make a well in the center and pour in the yeast mixture.",
                "Mix until a dough forms, then knead on a floured surface for about 10 minutes until smooth.",
                "Place the dough in a lightly oiled bowl, cover with a cloth, and let it rise for 1-2 hours or until doubled in size.",
                "Punch down the dough, shape it into a baguette, and place on a baking sheet.",
                "Let it rise for another 30 minutes.",
                "Preheat the oven to 450°F (230°C).",
                "Slash the top of the baguette with a sharp knife and bake for 20-25 minutes until golden brown."
            ],
            "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Baguette_de_pain%2C_WikiCheese_Lausanne.jpg/120px-Baguette_de_pain%2C_WikiCheese_Lausanne.jpg"
        },
        "relationships": {
            "country": {
                "data": {
                    "id": "4",
                    "type": "country"
                }
            }
        }
    }
}
```
___
#### All Users

`GET /api/v1/users`
**Example response:**
```
{
    "data": [
        {
            "id": "1",
            "type": "user",
            "attributes": {
                "name": "Woodstock",
                "email": "snoopy@bread.com",
                "password_digest": "d38304ga;lksadjiea"
            }
        },
        {
            "id": "2",
            "type": "user",
            "attributes": {
                "name": "Snoopy",
                "email": "redbaron@gmail.com",
                "password_digest": "$2a$12$qgkDLHr.ANY/CU6NiofckudAjHrW87NdFu346CHnp7vk2Va0KDtQu"
            }
        }
    ]
}
```
___
#### Specific Users Details (pass the endpoint a user id)

`GET /api/v1/users/:user_id`
**Example response:**
```
 {
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "name": "Snoopy",
            "email": "redbaron@gmail.com",
            "password_digest": "$2a$12$qgkDLHr.ANY/CU6NiofckudAjHrW87NdFu346CHnp7vk2Va0KDtQu"
        }
    }
}
```
___

### Database Diagram
![Bread Diagram](https://github.com/2308-Bread/rails_bread_be/assets/139706925/e10f20c0-438a-4a1b-8e94-e5673aa27031)
