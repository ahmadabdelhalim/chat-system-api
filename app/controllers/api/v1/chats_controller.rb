class Api::V1::ChatsController < ApplicationController
  before_action :set_application, only: [:index, :show, :create, :update]
  before_action :find_chat, only: [:show, :update]

  def index
    @chats = @application.chats
    render json: @chats, each_serializer: Api::V1::ChatSerializer
  end

  def show
    render json: @chat, status: :ok
  end

  def create
    @chat = @application.chats.new
    if @chat.valid?
      ChatCreatorWorker.perform_async(@chat.application_id)
      render json: { chat_number: 'Success' }, status: :created
    end
  end

  private

  def set_application
    @application = Application.find_by!(access_token: params[:application_access_token])
  end

  def find_chat
    @chat = @application.chats.find_by!(number: params[:number])
  end
end