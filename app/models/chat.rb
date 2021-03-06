class Chat < ApplicationRecord
  # relations
  belongs_to :application
  has_many :messages, dependent: :destroy

  # validations
  validates :application_id, :chat_number, presence: true
  validates :chat_number, uniqueness: { scope: :application_id }

  # methods
  def messages_count
    Rails.cache.fetch([self, "messages_count"], expires_in: 1.hour) { self.messages.size }
  end
end
