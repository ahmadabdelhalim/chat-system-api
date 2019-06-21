class Application < ApplicationRecord
  has_secure_token :access_token

  # validations
  validates :name, presence: true
  validates :access_token, uniqueness: true 
end
