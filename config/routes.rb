Eg::Application.routes.draw do

  devise_for :teachers
  devise_for :admins, controllers: {sessions: 'hq/sessions'}, path: 'hq',
             path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret',
                          confirmation: 'verification'}
  devise_for :users
  root to: 'welcome#index'

  # Routing for user profile editing
  match '/profile', to: 'profile#edit', via: :get
  match '/profile', to: 'profile#update', via: [:patch, :put]

  namespace :hq do
    # Routing for admin profile editing
    match '/profile', to: 'profile#edit', via: :get
    match '/profile', to: 'profile#update', via: [:patch, :put]
    resources :dashboard, only: [:index]
    root to: 'dashboard#index'
    resources :users, except: [:destroy]
    resources :teachers, except: [:destroy]
    resources :semesters
    resources :class_rooms
  end

  namespace :teacher do
    resources :dashboard, only: [:index]
    resources :class_rooms, only: [:show, :index]
    resources :users, only: [:show, :index]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Routing for user profile editing
  match '/profile', to: 'profile#edit', via: :get
  match '/profile', to: 'profile#update', via: [:patch, :put]


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
