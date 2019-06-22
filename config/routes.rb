Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :applications, param: :access_token, only: [:index, :show, :create, :update] do
        resources :chats, param: :chat_number, only: [:index, :show, :create] do
          resources :messages, param: :message_number, only: [:index, :show, :create, :update]
        end
      end
    end
  end
end
