class Api::V1::ChatSerializer < ActiveModel::Serializer
  attributes :application_access_token, :chat_number, :created_at, :updated_at
  has_many :messages

  def application_access_token
    object.application.access_token
  end
end
