Rails.application.routes.draw do

  root to: 'links#index'

  get '/users/new', to: 'users#new'           # show me the new user signup form
  post '/users', to: 'users#create'              # the form action for signup

  get 'users/login', to: 'sessions#login'   # show the login page
  post 'users/session', to: 'sessions#create'   # set the user id in the session if the password checks out
  delete 'users/session', to: 'sessions#destroy'     # remove user id from session

  get '/links/new', to: 'links#new'            # show the form for a new link
  post '/links', to: 'links#create'               # the form action for new link, creates a link (if logged in)
  get 'link/:id', to: 'links#find', as: 'link_id'              # takes you to the thing it links to
  #
  get '/link/:id/comments', to: 'comments#show'    # get the page for a link, its comments, and comment form
  post '/link/:id/comments', to: 'comments#create'   # the form action for new comment, creates a comment (if logged in)
  #

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
