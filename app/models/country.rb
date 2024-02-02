class Country < ApplicationRecord
  has_many :breads

<<<<<<< HEAD
  validates_presence_of :name,:description
=======
  validates :name, presence: true
  validates :description, presence: true
>>>>>>> origin/validations_tests
end
