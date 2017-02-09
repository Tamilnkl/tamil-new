TamilNew::Application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :members

  #get "welcome/index"
  resources :invoices
  resources :products
  resources :users
  
  resources :translations do
      get 'import',:on => :collection
      collection { post :upload }
    end
  # The priority is based upon order of creation:
  # first created -> highest priority.
   devise_scope :user do
   get "signup", to: "devise/registrations#new"
   get "login", to: "devise/sessions#new"
  get "logout", to: "devise/sessions#destroy"
end
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :productszz
   
  
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
  
  #root 'welcome#index'
   root :to => 'invoices#index'
   root :to => 'users#index'
   root :to => 'products#index'
   match "/product_regenerate_price" => "products#product_regenerate_price"
  #  match "/verify_login" => "users#verify_login"
  #match '/welcome/new' =>'welcome#new'
  #match '/welcome/edit'=>'welcome#edit'
  #match '/welcome/show'


    # resources :users do
     # get 'edit',:on => :collection
    #  get 'download_as_csv',:on => :collection
     # get 'verify_login',:on => :collection

   # end

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
