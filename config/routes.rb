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
  resources :users, except: :index, shallow: true do
    resources :wallets
  end
  
  get 'users/profile', as: 'user_root'
  
  root 'main#index'

end
