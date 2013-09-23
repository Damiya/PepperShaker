PepperShaker::Application.routes.draw do
  apipie
  root 'application#index'

  #Hiding the url in env so I can scrape from an external site through a hidden url if i want
  get ENV['SCRAPER_URL'] + '/scrape/:id' => 'scraper#scrape'
  get ENV['SCRAPER_URL'] + '/cheat/:id' => 'scraper#cheat'

  namespace :api, defaults: { format: 'json' } do
    resources :champions, :controller => 'champions', constraints: { :id => /\d+/ } do
      member do
        get ':id' => :show
        get ':id/fights' => :show_fights_by_id
        get ':id/wins' => :show_wins_by_id
        get ':id/losses' => :show_losses_by_id
      end
      collection do
        get 'list' => :list_champions
        get 'index' => :index
      end
    end

    get 'fights/by_name/:champ_one/:champ_two' => 'fights#compare_by_name', :constraints => { :champ_one => /[^\/]+/, :champ_two => /[^\/]+/ }
    get 'fights/by_id/:champ_one/:champ_two' => 'fights#compare_by_id', :constraints => { :champ_one => /\d+/, :champ_two => /\d+/ }

    resource :user do
      member do
        get ':id' => 'user#show', :constraints => { :id => /\d+/ }
      end
    end
    get 'stats' => 'errata#stats'
    get 'f/:champ_one/:champ_two' => 'fights#redirect_to_hightower', :constraints => { :champ_one => /\d+/, :champ_two => /\d+/ }
    get 'c/:id' => 'champion#redirect_to_hightower', :constraints => { :id => /\d+/ }
  end


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
