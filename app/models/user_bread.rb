class UserBread < ApplicationRecord
  belongs_to :users
  belongs_to :breads
end
