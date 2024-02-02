class Bread < ApplicationRecord
  belongs_to :country

  has_many :user_breads
  has_many :users, through: :user_breads
end