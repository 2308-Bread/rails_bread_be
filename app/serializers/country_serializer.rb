class CountrySerializer
  include JSONAPI::Serializer
  attributes :name, :description

  has_many :breads
end
