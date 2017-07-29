Rails.application.routes.draw do

  root to: "users#index"

  resources :users

  # namespace :api do
  #   namespace :v1 do
  #     resources :users
  #   end
  # end
end
