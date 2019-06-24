class ElasticSearchWorker
  include Sidekiq::Worker
  sidekiq_options queue: :elastic_search, retry: 10

  def perform(klass, id)
    Rails.logger.debug("Indexing #{klass} id #{id}")
    klass.constantize.find(id).reindex
  end
end