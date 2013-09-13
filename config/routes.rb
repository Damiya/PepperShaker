PepperShaker::Application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
  root 'application#index'

  #Hiding the url in env so I can scrape from an external site through a hidden url if i want
  # Wait does that even work?
  get ENV['SCRAPER_URL'] + '/scrape/:id' => 'scraper#scrape'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resource :champion do
        member do
          get 'show/:name' => 'champion#show'
          get 'show/:name/fights' => 'champion#show_fights'
        end
      end
      resource :fight do
        member do
          get 'show/:id' => 'fight#show'
        end
      end
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
