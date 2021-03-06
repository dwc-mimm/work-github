Rails.application.routes.draw do

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, except: [:destroy]
    resources :orders, only: [:index, :show, :update]
    #resources :searches, only: [:index, :show, :update]
  
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers, controllers: {
    sessions: 'public/customers/sessions',
    passwords: 'public/customers/passwords',
    registrations: 'public/customers/registrations'
  }

  root to: 'public/products#top'
  get '/about' => 'public/products#about', as: 'about'
  get 'customers/quit' => 'public/customers#quit', as: 'quit'
  patch 'customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'
  patch '/customers/:id/hide' => 'public/customers#hide', as: 'customers_hide'

  get '/search', to: 'searches#search'
  get '/admin/search', to: 'admin/searches#search', as:'admin_search'
  post 'orders/confirm' => 'public/orders#confirm', as:'confirm'
  get 'orders/complete' => 'public/orders#complete', as:'complete'

  scope module: :public do
    resources :products, only: [:index, :show]
    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :orders, only: [:new,:create,:index,:show]
    resources :searches, only: [:index, :show, :update]
    resources :carts, only: [:index, :create, :update, :destroy] do
      collection do
        delete '/' => 'carts#destroy_all'
      end
    end
  end

  namespace :admin do
    resources :order_products, only: [:update]
  end
end
