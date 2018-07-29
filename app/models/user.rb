class User < ApplicationRecord
  has_secure_password

  has_many :questions, foreign_key: :author_id
  has_many :sessions

  validates :email, :username, :firstname, :lastname, presence: true

  SYSTEM = 'SYSTEM'
end
