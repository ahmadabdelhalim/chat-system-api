class Application < ApplicationRecord
  has_secure_token :access_token

  # relations
  has_many :chats, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :access_token, uniqueness: true

  # methods
  def chats_count
    Rails.cache.fetch([self, "chats_count"], expires_in: 1.hour) { self.chats.size }
  end
end
