Rails.application.routes.draw do
  devise_for :users
   get "home/about" => "homes#about", as: "about"
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update, :create]
  resources :books

# resources :,only: [:edit, :index, :show]
end
