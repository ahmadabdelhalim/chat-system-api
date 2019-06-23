class ChatCreatorWorker
  include Sidekiq::Worker

  def perform(application_id, chat_number)
    Chat.create!(application_id: application_id, chat_number: chat_number)
  end
end
