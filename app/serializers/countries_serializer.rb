class CountriesSerializer
  include JSONAPI::Serializer
  attributes :name, :description
end