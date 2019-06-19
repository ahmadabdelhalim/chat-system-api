class Application < ApplicationRecord
  has_secure_token :access_token

  # validations
  validates :access_token, :name, presence: true
  validates :access_token, uniqueness: true 
end
