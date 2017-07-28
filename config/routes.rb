Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
  root 'sessions#welcome'

  get 'quienes-somos' => 'sessions#about_us', as: :about_us
  get 'signup' => 'users#new', as: :signup

# Book Tutorial Rails
#  get    '/login',   to: 'sessions#new'
#  post   '/login',   to: 'sessions#create'
#  delete '/logout',  to: 'sessions#destroy'

  get 'login' => 'sessions#new', as: :login
  post 'signin' => 'sessions#create', as: :signin
  delete 'logout' => 'sessions#destroy', as: :logout
  

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]



end
