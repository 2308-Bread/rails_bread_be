class User < ApplicationRecord
  has_secure_password
  
  has_many :user_breads
  has_many :breads, through: :user_breads

  validates :name, :password_digest
  validates :email, uniqueness: true
  validates :emial, format: {with: URI::MailTo::EMAIL_REGEXP}
end
