class Bread < ApplicationRecord
  belongs_to :country
<<<<<<< HEAD
  has_many :users, through: :user_breads

  validates_presence_of :name, :description, :recipe
=======

  validates :name, presence: true
  validates :description, presence: true
  validates :recipe, presence: true
>>>>>>> origin/validations_tests
end
