Rails.application.routes.draw do
  devise_for :users
  
  root to: 'dashboard#index'
  
  namespace :references do
    resources :clients do 
      get 'select_clients_dialog', on: :collection
    end  
    resources :users
    resources :stock_locations
    resources :brands
    resources :models do 
      get 'select_models_dialog', on: :collection
    end  
  end
  
  namespace :documents do
    resources :orders
  end  
end
