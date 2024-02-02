class User < ApplicationRecord
  has_many :user_breads
  has_many :breads, through: :user_breads
  
  validates_presence_of :name, :password_digest, :email
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  
  has_secure_password
end

