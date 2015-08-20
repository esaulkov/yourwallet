Rails.application.routes.draw do
  get 'main/index'

  get 'main/about'

  get 'main/contact'

  get 'profile', to: 'users#show', as: 'profile'

  devise_for :users
  resources :categories, shallow: true do
    resources :purchases
  end
  resources :transactions
  resources :wallets
  
  resources :users, only: :show
  get 'users/profile', as: 'user_root'
  
  root 'main#index'

end
