class User < ApplicationRecord
<<<<<<< HEAD
  has_secure_password
  
  has_many :user_breads
  has_many :breads, through: :user_breads

  validates :name, :password_digest
  validates :email, uniqueness: true
  validates :emial, format: {with: URI::MailTo::EMAIL_REGEXP}
=======
  has_many :user_breads

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
>>>>>>> origin/validations_tests
end
