class Message < ApplicationRecord
  # relations
  belongs_to :chat

  # validations
  validates :chat_id, :message_number, :body, presence: true
  validates :message_number, uniqueness: { scope: :chat_id }

  # elasticsearch
  searchkick searchable: [:body], text_start: [:body]

  def search_data
    {
      body: body
    }
  end
end
