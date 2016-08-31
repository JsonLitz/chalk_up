Rails.application.routes.draw do
  root "climbs#index"
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
  get '/climbs/:id/edit' => "climbs#edit", as: "edit_climb"
  patch '/climbs/:id' => "climbs#update"
  delete '/climbs/:id' => "climbs#destroy"

  get "/climbs/:id/comments" => "comments#index", as: "comments"
  get "/climbs/:id/comments/new" => "comments#new", as: "new_comment"
  post "/climbs/:id/comments/new" => "comments#create"
  get "/comments/:id" => "comments#show", as: "comment"
  get "/comments/:id/edit" => "comments#edit", as: "edit_comment"
  patch "/comments/:id" => "comments#update"
  delete "/comments/:id" => "comments#destroy", as: "delete_comment"

end
