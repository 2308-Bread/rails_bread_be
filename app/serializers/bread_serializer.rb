class BreadSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :recipe

  belongs_to :country 
end
