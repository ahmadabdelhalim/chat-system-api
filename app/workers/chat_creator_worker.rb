class ChatCreatorWorker
  include Sidekiq::Worker

  def perform(application_id)
    Chat.create!(application_id: application_id)
  end
end
