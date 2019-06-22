class Message < ApplicationRecord
  # relations
  belongs_to :chat

  # validations
  validates :chat_id, :message_number, :body, presence: true
  validates :message_number, uniqueness: { scope: :chat_id }

  # callbacks
  auto_increment :message_number, 
                              scope: [:chat_id],
                              initial: 1,
                              force: true,
                              lock: false
end
