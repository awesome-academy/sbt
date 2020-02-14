Rails.application.routes.draw do

  get "/profile", to: "accounts#show"
  get "setting", to: "accounts#edit"
  get 'users/new'
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  delete "/logout",to: "sessions#destroy"
  resources :sessions
  resources :tours
  resources :reviews
end

