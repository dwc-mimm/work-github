Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/products#top'
  get '/about' => 'public/homes#about', as: 'about'

  scope module: :public do
    resources :products, only: [:index, :show]
    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  end

end
