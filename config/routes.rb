Rails.application.routes.draw do

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers

  root to: 'public/products#top'
  get '/about' => 'public/products#about', as: 'about'
  

  scope module: :public do
    resources :products, only: [:index, :show]
    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
    resources :carts, only: [:index, :create, :update, :destroy] 
    resources :customers, only: [:show] do
      collection do
        delete '/' => 'carts#destroy_all'
      end
    end
  end

  namespace :admin do
    resources :order_products, only: [:update]
  end


end
