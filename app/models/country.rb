class Country < ApplicationRecord
  has_many :breads

  validates_presence_of :name, :description
end
