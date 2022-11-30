Rails.application.routes.draw do
  resources :ports
  resources :categories

  root "ports#index"

  devise_for :users

  # Serve websocket cable requests in-process
  mount ActionCable.server => "/cable"
end

