# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :books
      resources :games
      resources :authors
      resources :developers
      resources :tokens, only: %i[create]
    end
  end
end
