Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  api_version(:module => "V1", :header => {:name => "X-Api-Version", :value => "1"}) do
    resources :tasks, only: [:index] do
      post :execute, on: :collection
    end
  end
end
