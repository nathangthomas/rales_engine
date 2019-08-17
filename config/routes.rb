Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      # get '/merchants/find', to: 'find#show'
      # get '/merchants/:id', to: 'merchants#show'
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     resources :customers, only: [:show]
  #   end
  # end

   get '/api/v1/customers/:id/favorite_merchant', to: 'api/v1/customers/favorite_merchant#show'
   #returns a merchant where the customer has conducted the most successful transactions








  # get '/api/v1/merchants/find?parameters, to: search#index'
  # get '/api/v1/merchants/find_all?parameters, to: search#show'


  # namespace :api do
  #   namespace :v1 do
  #     namespace :merchants do
  #       get '/find', to: 'find#show'
  #       get '/find_all', to: 'find#index'
  #       get '/random', to: 'random#show'
  #     end
  #     namespace :customers do
  #       get '/find', to: 'find#show'
  #       get '/find_all', to: 'find#index'
  #       get '/random', to: 'random#show'
  #     end
  #     resources :merchants, only: [:index, :show]
  #     resources :customers, only: [:index, :show]
  #   end
  # end

end
