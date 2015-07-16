Rails.application.routes.draw do
  root to: "welcome#index"
  # root to: "users#index"

  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#new", as: "new_user"
   post "/users", to: "users#create"
     get "/users/:id", to: "users#show", as: "user_show"

       get "/sign_in", to: "sessions#new"
         post "/sessions", to: "sessions#create"

         # get "/locations", to:"locations#index"
     get "/users/:user_id/locations", to: "locations#index", as: "user_location"
     get "/users/:user_id/locations/new", to: "locations#new", as: "user_location_new"
     post "/users/:user_id/locations", to: "locations#create"
     get "/users/:user_id/locations/:id", to: "locations#show", as: "user_location_show"
     get "/users/:user_id/locations/:id/edit", to: "locations#edit", as: "user_location_edit"
    put "/users/:user_id/locations/:id", to: "locations#update"
    delete "/users/:user_id/locations/:id", to: "locations#destroy"

          # resources :locations

           post "/sessions", to: "sessions#create"
  get "/sessions", to: "sessions#destroy"

end
