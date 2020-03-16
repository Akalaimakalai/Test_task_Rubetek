require 'sidekiq/web'

Rails.application.routes.draw do
  root "tasks#new"

  resources :stats, only: %i[ index ]
  resources :tasks, only: %i[ new create ]

  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[ create ]
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
