Rails.application.routes.draw do
  root 'todos#index'
  resources :todos
  # Root route
  # Resourceful route for todos
  # Custom route example
end