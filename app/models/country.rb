class Country < ApplicationRecord
  has_many :breads

  validates_presence_of :name, :overview, :culinary, :imageUrl

  def self.find_country(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
