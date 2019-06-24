class Message < ApplicationRecord
  include Indexable

  # elasticsearch
  searchkick searchable: [:body], text_start: [:body], callbacks: false

  def search_data
    {
      body: body
    }
  end

  # relations
  belongs_to :chat

  # validations
  validates :chat_id, :message_number, :body, presence: true
  validates :message_number, uniqueness: { scope: :chat_id }

  # callbacks
  after_commit :index_elasticsearch
end
