Rails.application.routes.draw do
  get 'rents/new'
  get 'rents/create'
  get 'rents/my_rents'
  get 'rents/edit'
  get 'rents/update'
  get 'rents/destroy'
  get 'rents/index'
  get 'rents/show'
  get 'games/index'
  get 'games/show'
  get 'games/new'
  get 'games/create'
  get 'games/my_games'
  get 'games/edit'
  get 'games/update'
  get 'games/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
