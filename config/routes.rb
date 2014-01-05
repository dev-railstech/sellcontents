SellContent::Application.routes.draw do

  devise_for :users
  root :to => 'home#index'
  get "/checkout/:code" => "home#checkout", :as => :checkout
  post "/checkout/:code" => "home#checkout", :as => :checkout


  get '/profile' => "profile#upload", :as => :profile_upload
  post '/profile' => "profile#upload", :as => :profile_upload
  get '/profile/c/:code' => "profile#edit_product", :as => :profile_product
  put '/profile/c/:code' => "profile#update_product", :as => :profile_product_update
  delete '/profile/c/:code' => "profile#delete_product", :as => :profile_product_delete
  put '/profile/c/:code/save_content' => "profile#save_content", :as => :profile_product_save_content
  delete '/profile/c/:code/save_content/:id' => "profile#delete_content", :as => :profile_product_delete_content
  delete '/profile/c/:code/save_cover/:id' => "profile#delete_cover", :as => :profile_product_delete_cover

  get '/profile/products' => "profile#products", :as => :profile_products

  get '/profile/bought_orders' => "profile#bought_orders", :as => :profile_bought_orders
  get '/profile/sold_orders' => "profile#sold_orders", :as => :profile_sold_orders
  get '/profile/bought_order/:id' => "profile#bought_order", :as => :profile_bought_order
  get '/profile/sold_order/:id' => "profile#sold_order", :as => :profile_sold_order


  #Should be at the bottom
  get "/:code" => "home#from_code", :as => :from_code


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
