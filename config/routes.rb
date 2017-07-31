Rails.application.routes.draw do

  root to: "users#index"

  resources :users, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
    end
  end
end
