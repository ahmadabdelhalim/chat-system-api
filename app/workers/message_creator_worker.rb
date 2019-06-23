class MessageCreatorWorker
  include Sidekiq::Worker

  def perform(chat_id, body, message_number)
    Message.create!(chat_id: chat_id, body: body, message_number: message_number)
  end
end
