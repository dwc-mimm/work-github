Rails.application.routes.draw do

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
  }

  root to: 'public/products#top'
  get '/about' => 'public/products#about', as: 'about'

  scope module: :public do
    resources :products, only: [:index, :show]
    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :order_products, only: [:update]
  end


end
