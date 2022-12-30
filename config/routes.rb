Rails.application.routes.draw do
  resources :platforms do
    resources :categories do
      resources :ports
    end
  end

  root "ports#index"

  devise_for :users

  # WebSockets w/ relayd(8)
  mount ActionCable.server => "/cable"
end

