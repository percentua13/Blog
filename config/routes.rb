Rails.application.routes.draw do

  root :to => 'home#index'

  get 'post/myposts'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'account/create'
  get 'account/store'
  get 'post/create'
  get 'post/store'
  #get 'first/HelloWorld'
  #get 'try/tryA'
  #get 'info/hello'
  #get 'hello/init'
  get 'home/index'
  get 'post/create'
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
