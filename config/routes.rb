Rails.application.routes.draw do

  root to: 'task#index'

  # 認証関連
  get  '/login'  => 'auth#new'   , as: 'login'
  post '/login'  => 'auth#create', as: 'auth'
  post '/logout' => 'auth#delete', as: 'logout'

  # ユーザ関連
  get    '/user'          => 'user#index' , as: 'users'
  post   '/user'          => 'user#create', as: ''
  get    '/user/new'      => 'user#new'   , as: 'new_user'
  get    '/user/:id/edit' => 'user#edit'  , as: 'edit_user'
  put    '/user/:id'      => 'user#update', as: 'user'
  patch  '/user/:id'      => 'user#update', as: ''
  delete '/user/:id'      => 'user#delete', as: ''

  # タスク関連
  get  '/task'          => 'task#index' , as: 'tasks'
  post '/task'          => 'task#create', as: ''
  get  '/task/:id'      => 'task#update', as: 'task'
  delete '/task/:id'    => 'task#delete', as: ''
  get  '/task/:id/content' => 'task#content', as: 'content_task' 

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
