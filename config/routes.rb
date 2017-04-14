Rails.application.routes.draw do
    root "welcome#home"
    
    get "/signin", to: "sessions#new"
    post "/signin", to: "sessions#create"
    delete "/signout", to: "sessions#delete"
    
    resources :users

    resources :attractions

end