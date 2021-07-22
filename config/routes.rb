Rails.application.routes.draw do

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, except: [:destroy]
    resources :orders, only: [:index, :show, :update]
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers
<<<<<<< HEAD

=======
>>>>>>> 3ee0324f30cf44ad93fba897b3317bf6d1f28394

  root to: 'public/products#top'
  get '/about' => 'public/products#about', as: 'about'
  get 'customers/quit' => 'public/customers#quit', as: 'quit'
  patch 'customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'

  get '/search', to: 'searches#search'
  get 'orders/confirm' => 'public/orders#confirm', as:'confirm'
  get 'orders/complete' => 'public/orders#complete', as:'complete'

<<<<<<< HEAD
  
=======
>>>>>>> 3ee0324f30cf44ad93fba897b3317bf6d1f28394
  scope module: :public do
    resources :orders, only: [:new, :create, :index, :show]
    resources :products, only: [:index, :show]
    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
    resources :carts, only: [:index, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :orders,only: [:new,:create,:index,:show] do
      collection do
        delete '/' => 'carts#destroy_all'
      end
    end
  end

  namespace :admin do
    resources :order_products, only: [:update]
  end
end
