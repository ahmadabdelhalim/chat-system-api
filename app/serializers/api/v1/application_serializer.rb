class Api::V1::ApplicationSerializer < ActiveModel::Serializer
  attributes :access_token, :name, :chats_count, :created_at, :updated_at
  has_many :chats
end
