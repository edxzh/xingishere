Mywebsite::Application.routes.draw do
  resources :messages, only: [:create, :destory, :index]


  resources :links
  resources :link_category

  resources :sessions,  only: [:new, :create, :destory]

  get "account/advanced"
  get "account/icon"
  get "account/profile"
  post "account/update_pro"
  post "account/update_adv"
  get "home/index"
  root  to: 'home#index', as: :root

  resources :comments

  resources :blogs do
    collection do
      get "user_like"
    end
  end

  resources :users
  match '/register',  to: 'users#new',          via: 'get'
  match '/login',     to: 'sessions#new',       via: 'get'
  match '/logout',    to: 'sessions#destroy',   via: 'get'

  match 'about', to: 'pages#about', as: :about
  match 'me', to: 'pages#me', as: :me

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
