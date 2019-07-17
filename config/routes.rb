Rails.application.routes.draw do
  resources :complaint_types
  resources :reactions
  resources :complaints
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/login", to: "auth#login"
end
