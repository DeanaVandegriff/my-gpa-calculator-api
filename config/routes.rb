Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/courses" => "courses#index"
  get "/courses/:id" => "courses#show"
  post "/courses" => "courses#create"
  patch "/courses/:id" => "courses#update"
  delete "/courses/:id" => "courses#destroy"
end
