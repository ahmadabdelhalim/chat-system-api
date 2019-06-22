class Api::V1::MessagesController < ApplicationController
  before_action :set_application, only: [:index, :show, :create, :update]
  before_action :set_chat, only: [:index, :show, :create, :update]
  before_action :find_message, only: [:show, :update]

  def index
    query = params[:body].presence || "*"
    @messages = @chat.messages.search(query, match: :text_start, includes: [:chat])
    render json: @messages, each_serializer: Api::V1::MessageSerializer
  end

  def show
    render json: @message, status: :ok
  end

  def create
    @message = @chat.messages.new(message_params)
    if @message.valid?
      message_number = $redis.incr("#{@message.chat_id}_messages_count")
      MessageCreatorWorker.perform_async(@message.chat_id, @message.body)
      render json: { message_number: message_number }, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      render json: @message, status: :ok
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def set_application
    @application = Application.find_by!(access_token: params[:application_access_token])
  end

  def set_chat
    @chat = @application.chats.find_by!(chat_number: params[:chat_chat_number])
  end

  def find_message
    @message = @chat.messages.find_by!(message_number: params[:message_number])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end