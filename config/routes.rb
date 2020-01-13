Rails.application.routes.draw do
  get "session/new"
  get "users/new"
  scope "(:locale)", locale: /en|vi/ do

    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get  "/signup", to: "accounts#new"
    post "/signup", to: "accounts#create"
    resources :accounts
  end
end
