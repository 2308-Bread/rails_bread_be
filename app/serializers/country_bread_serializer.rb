class CountryBreadSerializer
  def initialize(country, country_breads)
    @country = country
    @breads = country_breads
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
            ingredients: bread.ingredients,
            instructions: bread.instructions,
          }
        }
      }
    end
  end
end