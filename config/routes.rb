Rails.application.routes.draw do
  root to: "welcome#index"
  # root to: "users#index"

  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#new", as: "new_user"
   post "/users", to: "users#create"
     get "/users/:id", to: "users#show", as: "user_show"

       get "/sign_in", to: "sessions#new"
         post "/sessions", to: "sessions#create"

         get "/locations", to:"locations#index"
# get "/users/:id/locations", to: "locations#index"

          resources :locations

end
