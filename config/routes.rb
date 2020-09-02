Rails.application.routes.draw do
  devise_for :users
  # root to: "homes#index"
  root to: "items#index"
  resources :items, only: [:new, :create, ]
end
