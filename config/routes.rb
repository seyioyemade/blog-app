Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#post1'
  get "/users/745", to: "users#post2"
  get "/users/745/posts", to: "users#post4"
  get "/users/745/posts/3", to: "users#post4"
end
