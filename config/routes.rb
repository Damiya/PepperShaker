PepperShaker::Application.routes.draw do
  devise_for :users, {
      :path_names => { :sign_in => 'sign-in', :sign_out => 'sign-out' }, # Changed to be more consistent with ember
      :controllers => { :sessions => 'sessions'}
  }

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root 'application#index'

  #Hiding the url in env so I can scrape from an external site through a hidden url if i want
  get ENV['SCRAPER_URL'] + '/scrape/:id' => 'scraper#scrape'
  get ENV['SCRAPER_URL'] + '/cheat/:id' => 'scraper#cheat'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resource :champion do
        member do
          get ':id' => 'champion#show_by_id', :constraints => { :id => /[0-9]+/ }
          get ':id/fights' => 'champion#show_fights_by_id', :constraints => { :id => /[0-9]+/ }
          get ':id/wins' => 'champion#show_wins_by_id', :constraints => { :id => /[0-9]+/ }
          get ':id/losses' => 'champion#show_losses_by_id', :constraints => { :id => /[0-9]+/ }
        end
        collection do
          get 'list' => 'champion#list_champions'
        end
      end
      resource :fight do
        member do
          get 'by_name/:champ_one/:champ_two' => 'fight#compare_by_name', :constraints => { :champ_one => /[^\/]+/, :champ_two => /[^\/]+/ }
          get 'by_id/:champ_one/:champ_two' => 'fight#compare_by_id', :constraints => { :champ_one => /[0-9]+/, :champ_two => /[0-9]+/}
        end
      end
      resource :user do
        member do
          get ':id' => 'user#show', :constraints => { :id => /[0-9]+/}
        end
      end
      get 'stats' => 'errata#stats'
      get 'f/:champ_one/:champ_two' => 'fight#redirect_to_hightower', :constraints => { :champ_one => /[0-9]+/, :champ_two => /[0-9]+/}
      get 'c/:id' => 'champion#redirect_to_hightower', :constraints => { :id => /[0-9]+/}
    end
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
