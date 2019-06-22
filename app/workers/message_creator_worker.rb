class MessageCreatorWorker
  include Sidekiq::Worker

  def perform(chat_id, body)
    Message.create!(chat_id: chat_id, body: body)
  end
end
