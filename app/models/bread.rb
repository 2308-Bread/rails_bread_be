class Bread < ApplicationRecord
  belongs_to :country

  validates :name, presence: true
  validates :description, presence: true
  validates :recipe, presence: true
end
