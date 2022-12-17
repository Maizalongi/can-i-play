Rails.application.routes.draw do
  resources :games do
    resources :rents, only: %i[new create]
  end
  resources :rents, except: %i[new create]
  get 'games/my_games'
  get 'rents/:id/accept', to: 'rents#accept', as: :rent_accept
  get 'rents/:id/deactivate', to: 'rents#deactivate', as: :rent_deactivate
  devise_for :users
  get 'my_games', to: 'games#my_games', as: :user_games
  get 'my_rents', to: 'rents#my_rents', as: :user_rents
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
