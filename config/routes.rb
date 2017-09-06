# == Route Map
#
#                        Prefix Verb   URI Pattern                                                    Controller#Action
#    admin_master_careers_index GET    /admin/master_careers/index(.:format)                          admin/master_careers#index
#     admin_master_careers_show GET    /admin/master_careers/show(.:format)                           admin/master_careers#show
#      admin_master_careers_new GET    /admin/master_careers/new(.:format)                            admin/master_careers#new
#     admin_master_careers_edit GET    /admin/master_careers/edit(.:format)                           admin/master_careers#edit
#            admin_institutions GET    /admin/institutions(.:format)                                  admin/institutions#index
#                               POST   /admin/institutions(.:format)                                  admin/institutions#create
#         new_admin_institution GET    /admin/institutions/new(.:format)                              admin/institutions#new
#        edit_admin_institution GET    /admin/institutions/:id/edit(.:format)                         admin/institutions#edit
#             admin_institution GET    /admin/institutions/:id(.:format)                              admin/institutions#show
#                               PATCH  /admin/institutions/:id(.:format)                              admin/institutions#update
#                               PUT    /admin/institutions/:id(.:format)                              admin/institutions#update
#                               DELETE /admin/institutions/:id(.:format)                              admin/institutions#destroy
#                   admin_areas GET    /admin/areas(.:format)                                         admin/areas#index
#                               POST   /admin/areas(.:format)                                         admin/areas#create
#                new_admin_area GET    /admin/areas/new(.:format)                                     admin/areas#new
#               edit_admin_area GET    /admin/areas/:id/edit(.:format)                                admin/areas#edit
#                    admin_area GET    /admin/areas/:id(.:format)                                     admin/areas#show
#                               PATCH  /admin/areas/:id(.:format)                                     admin/areas#update
#                               PUT    /admin/areas/:id(.:format)                                     admin/areas#update
#                               DELETE /admin/areas/:id(.:format)                                     admin/areas#destroy
#          admin_master_careers GET    /admin/master_careers(.:format)                                admin/master_careers#index
#                               POST   /admin/master_careers(.:format)                                admin/master_careers#create
#       new_admin_master_career GET    /admin/master_careers/new(.:format)                            admin/master_careers#new
#      edit_admin_master_career GET    /admin/master_careers/:id/edit(.:format)                       admin/master_careers#edit
#           admin_master_career GET    /admin/master_careers/:id(.:format)                            admin/master_careers#show
#                               PATCH  /admin/master_careers/:id(.:format)                            admin/master_careers#update
#                               PUT    /admin/master_careers/:id(.:format)                            admin/master_careers#update
#                               DELETE /admin/master_careers/:id(.:format)                            admin/master_careers#destroy
#     admin_institution_careers GET    /admin/institutions/:institution_id/careers(.:format)          admin/careers#index
#                               POST   /admin/institutions/:institution_id/careers(.:format)          admin/careers#create
#  new_admin_institution_career GET    /admin/institutions/:institution_id/careers/new(.:format)      admin/careers#new
# edit_admin_institution_career GET    /admin/institutions/:institution_id/careers/:id/edit(.:format) admin/careers#edit
#      admin_institution_career GET    /admin/institutions/:institution_id/careers/:id(.:format)      admin/careers#show
#                               PATCH  /admin/institutions/:institution_id/careers/:id(.:format)      admin/careers#update
#                               PUT    /admin/institutions/:institution_id/careers/:id(.:format)      admin/careers#update
#                               DELETE /admin/institutions/:institution_id/careers/:id(.:format)      admin/careers#destroy
#     admin_institution_courses GET    /admin/institutions/:institution_id/courses(.:format)          admin/courses#index
#                               POST   /admin/institutions/:institution_id/courses(.:format)          admin/courses#create
#  new_admin_institution_course GET    /admin/institutions/:institution_id/courses/new(.:format)      admin/courses#new
# edit_admin_institution_course GET    /admin/institutions/:institution_id/courses/:id/edit(.:format) admin/courses#edit
#      admin_institution_course GET    /admin/institutions/:institution_id/courses/:id(.:format)      admin/courses#show
#                               PATCH  /admin/institutions/:institution_id/courses/:id(.:format)      admin/courses#update
#                               PUT    /admin/institutions/:institution_id/courses/:id(.:format)      admin/courses#update
#                               DELETE /admin/institutions/:institution_id/courses/:id(.:format)      admin/courses#destroy
#                               GET    /admin/institutions(.:format)                                  admin/institutions#index
#                               POST   /admin/institutions(.:format)                                  admin/institutions#create
#                               GET    /admin/institutions/new(.:format)                              admin/institutions#new
#                               GET    /admin/institutions/:id/edit(.:format)                         admin/institutions#edit
#                               GET    /admin/institutions/:id(.:format)                              admin/institutions#show
#                               PATCH  /admin/institutions/:id(.:format)                              admin/institutions#update
#                               PUT    /admin/institutions/:id(.:format)                              admin/institutions#update
#                               DELETE /admin/institutions/:id(.:format)                              admin/institutions#destroy
#           password_resets_new GET    /password_resets/new(.:format)                                 password_resets#new
#          password_resets_edit GET    /password_resets/edit(.:format)                                password_resets#edit
#                     users_new GET    /users/new(.:format)                                           users#new
#                          root GET    /                                                              sessions#welcome
#                      about_us GET    /quienes-somos(.:format)                                       sessions#about_us
#                        signup GET    /signup(.:format)                                              users#new
#                         login GET    /login(.:format)                                               sessions#new
#                        signin POST   /signin(.:format)                                              sessions#create
#                        logout DELETE /logout(.:format)                                              sessions#destroy
#                         users GET    /users(.:format)                                               users#index
#                               POST   /users(.:format)                                               users#create
#                      new_user GET    /users/new(.:format)                                           users#new
#                     edit_user GET    /users/:id/edit(.:format)                                      users#edit
#                          user GET    /users/:id(.:format)                                           users#show
#                               PATCH  /users/:id(.:format)                                           users#update
#                               PUT    /users/:id(.:format)                                           users#update
#                               DELETE /users/:id(.:format)                                           users#destroy
#       edit_account_activation GET    /account_activations/:id/edit(.:format)                        account_activations#edit
#               password_resets POST   /password_resets(.:format)                                     password_resets#create
#            new_password_reset GET    /password_resets/new(.:format)                                 password_resets#new
#           edit_password_reset GET    /password_resets/:id/edit(.:format)                            password_resets#edit
#                password_reset PATCH  /password_resets/:id(.:format)                                 password_resets#update
#                               PUT    /password_resets/:id(.:format)                                 password_resets#update
# 

Rails.application.routes.draw do


  namespace :admin do
    get 'career_courses/index'
  end

  namespace :admin do
    get 'career_courses/new'
  end

  namespace :admin do
    get 'career_courses/edit'
  end

  namespace :admin do

    get '/', to: 'base#dashboard', as: :dashboard

    

    resources :institutions, :areas, :master_careers, :master_career_areas
    
    resources :institutions do
      resources :careers
      resources :courses
    end

    resources :careers do
      resources :career_courses
    end

    post 'import_courses_xls', to: 'base#import_courses_xls'
    post 'import_master_careers_areas_xls', to: 'base#import_master_careers_areas_xls'
  
  end

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
  get 'mis_ramos' => 'sessions#mis_ramos'#, as: :my_courses
  get 'mis_ramos/agregar' => 'sessions#agregar_ramos'
  patch 'mis_ramos/crear_ramos' => 'sessions#crear_ramos'

  resources :users do
    #put :update_career, on: :member

    #delete :delete_course, on: :member
    post :update_courses, on: :member
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]



end
