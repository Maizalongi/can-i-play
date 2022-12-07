Rails.application.routes.draw do
  resources :games
  resources :rents
  get 'games/my_games'

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
