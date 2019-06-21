class Api::V1::ApplicationSerializer < ActiveModel::Serializer
  attributes :access_token, :name, :created_at, :updated_at
end
