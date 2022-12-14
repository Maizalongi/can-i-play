Rails.application.routes.draw do
  resources :games do
    member do
      post 'add_to_wishlist'
      delete 'remove_of_wishlist'
    end
  end
  resources :rents
  get 'games/my_games'
  get 'rents/:id/accept', to: 'rents#accept', as: :rent_accept
  get 'rents/:id/deactivate', to: 'rents#deactivate', as: :rent_deactivate
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
