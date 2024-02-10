class Country < ApplicationRecord
  has_many :breads

  validates_presence_of :name, :overview, :culinary, :imageUrl
end
