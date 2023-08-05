Rails.application.routes.draw do
  devise_for :users
  resources :todos
  root to: 'todos#index'
  # Root route
  # Resourceful route for todos
  # Custom route example
end