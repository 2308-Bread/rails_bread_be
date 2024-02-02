class CountrySerializer
  include JSONAPI::Serializer
  attributes :name, :description
end