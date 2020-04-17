Rails.application.routes.draw do

  root :to => 'home#index'


  get 'account/update/:id', to: 'account#update'
  get 'account/info/:id', to: 'account#info'
  post 'account/updatesave', to: 'account#updatesave'

  get 'post/myposts'
  get 'post/create', to: 'post#create'
  get 'post/:id', to: 'post#currentpost'
  post '/comment/store/:id', to: 'comment#store'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'account/create'
  get 'account/store'


  get 'home/index'

  post 'post/store'


  get 'account/create'
  post 'account/store'


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'account#create', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
