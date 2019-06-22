class Api::V1::MessageSerializer < ActiveModel::Serializer
  attributes :chat_number, :message_number, :body, :created_at, :updated_at

  def chat_number
    object.chat.chat_number
  end
end
