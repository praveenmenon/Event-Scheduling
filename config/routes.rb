Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
   get 'welcome/event_handler' => 'welcome#event_handler'
   get 'static/index' => 'static#index'
   get 'sessions/create' =>'sessions#create'
   get 'sessions/new' => 'sessions#new'
   get 'welcome/demo' =>'welcome#demo'
   delete 'sessions/destroy' => 'sessions#destroy'
   get "users/check_email" => 'users#check_email'
   get "sessions/check_email" => 'sessions#check_email'
   get "sessions/check_password" => 'sessions#check_password'


   #OmniAuth twitter
   get '/auth/:provider/callback', to: 'sessions#create'
   get '/auth/failure', to: redirect('/')
   get 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
     resources :users
    resources :sessions

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
