class Api::V1::ChatsController < ApplicationController
  before_action :set_application, only: [:index, :show, :create, :update]
  before_action :find_chat, only: [:show, :update]

  def index
    @chats = @application.chats.includes(:messages)
    render json: @chats, each_serializer: Api::V1::ChatSerializer
  end

  def show
    render json: @chat, status: :ok
  end

  def create
    @chat = @application.chats.new
    if @chat.valid?
      chat_number = $redis.incr("#{@chat.application.access_token}_chats_count")
      ChatCreatorWorker.perform_async(@chat.application_id)
      render json: { chat_number: chat_number }, status: :created
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  private

  def set_application
    @application = Application.find_by!(access_token: params[:application_access_token])
  end

  def find_chat
    @chat = @application.chats.find_by!(chat_number: params[:chat_number])
  end
end