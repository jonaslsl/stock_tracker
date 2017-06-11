Rails.application.routes.draw do
  
  devise_for :users, controllers: { :registrations => 'user/registrations' }
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :friendship

  root 'welcome#index'
  
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_stocks', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'

end
