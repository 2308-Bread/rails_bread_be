class CountryBreadSerializer
  def initialize(country, country_breads)
    @country = country
    @breads = country_breads
    # require 'pry'; binding.pry
  end

  def serialized_response
    {
      country: {
        data: {
          id: @country.id,
          attributes: {
            name: @country.name,
            overview: @country.overview,
            culinary: @country.culinary,
            imageUrl: @country.imageUrl
          }
        }
      },
      breads: {
        data: self.class.build_baked_breads(@breads),
      }
    }
  end

  def self.build_baked_breads(breads)
    breads.map do |bread|
      {
        id: bread.id,
        attributes: {
          name: bread.name,
          description: bread.description,
          imageUrl: bread.imageUrl,
          recipe: {
            ingredients: JSON.parse(bread.ingredients),
            instructions: JSON.parse(bread.instructions),
          }
        }
      }
    end
  end

  def self.build_ingredient_list(bread)
    require 'pry'; binding.pry
    ingredients_parsed = JSON.parse(bread.ingredients)
    ingredients_parsed.map do |i|
      require 'pry'; binding.pry
    end
  end
end