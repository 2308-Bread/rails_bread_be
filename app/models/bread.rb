class Bread < ApplicationRecord
  belongs_to :country
  has_many :users, through: :user_breads

  validates_presence_of :name, :description, :recipe
end
