class BreadSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :ingredients, :instructions, :imageUrl

  belongs_to :country 
end
