Rails.application.routes.draw do
  root to: "climbs#index"
  get  "/users" => "users#index", as: "users"
  get "/users/new" => "users#new", as: "new_user"
  post "/users" => "users#create"
  get "/users/:id" => "users#show", as: "user"
  get "/users/:id" => "users#edit"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/login" => "sessions#new", as: "login"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy", as: "logout"

  get "/climbs" => "climbs#index", as: "climbs"
  get "/climbs/new" => "climbs#new", as: "new_climb"
  post "/climbs" => "climbs#create"
  get "/climbs/:id" => "climbs#show", as: "climb"

end
