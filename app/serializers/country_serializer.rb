class CountrySerializer
  include JSONAPI::Serializer
  attributes :name, :overview, :culinary, :imageUrl

  has_many :breads
end
