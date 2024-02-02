class Country < ApplicationRecord
  has_many :breads

  validates :name, presence: true
  validates :description, presence: true
end
