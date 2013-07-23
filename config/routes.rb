Minishopify::Application.routes.draw do

  resources :orders, only: ['new', 'create']
  get "/carts/:id", to: "carts#show", as: "cart"
  delete "/carts/:id", to: "carts#destroy"
  root "store#index"
  # get "/products", to: "products#index"
  # get "/products/:id", to: "products#show", as: "product"
  # get "/products/new"
  # post "/products", to: "products#create"
  # get "/products/:id/edit", to: "products#edit"
  # patch "/products/:id", to: "products#update"
  # delete "products/:id", to: "products#destroy"
  resources :products
  post "/line_items", to: "line_items#create"
  delete "/line_items/:id", to: "line_items#destroy", as: "line_item"
  put "/line_items/:id", to: "line_items#decrement"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
