Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  namespace :api do
    namespace :v1 do
      resources :applications, param: :access_token, only: [:index, :show, :create, :update] do
        resources :chats, param: :number, only: [:index, :show, :create, :update]
      end
    end
  end
end
