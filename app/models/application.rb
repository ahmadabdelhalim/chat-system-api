class Application < ApplicationRecord
  has_secure_token :access_token

  # relations
  has_many :chats, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :access_token, uniqueness: true 
end
