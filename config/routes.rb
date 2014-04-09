Share::Application.routes.draw do
    # Home page
  root "initials#index"

  # Movie resource
  resources :movies, shallow: true do
    resources :actors
    resources :comments
  end
  resources :directors, shallow: true do
    resources :movies
  end
  
  resources :actors, shallow: true do
    resources :movies
  end

  resources :groups, shallow: true do
    resources :comments
  end
  resources :comments
  resources :questions
  resources :rates
  resources :diaries
  resources :replies

  resources :books
  resources :songs

  resources :users
  resources :sessions

  get "/logout" => "sessions#destroy", as: 'logout'
  get "/groups/join/:group_id" => "groups#join"
  get "/groups/drop/:group_id" => "groups#drop"
  get "/todo/movie/:movie_id" => "movies#todo"
  get "/done/movie/:movie_id" => "movies#done"
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
