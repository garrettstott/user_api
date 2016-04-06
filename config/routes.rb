Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :users, except: [:new, :edit]
      get 'users_search', to: 'users#search'
    end
  end
end
