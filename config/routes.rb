Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
  root 'sessions#welcome'

  get 'quienes-somos' => 'sessions#about_us', as: :about_us

end
