Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help", as: "help"
    get "/about", to: "static_pages#about"
    get "/home" ,to: "static_pages#home"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(show destroy index)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
