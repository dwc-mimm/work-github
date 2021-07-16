Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/products#top'
  get '/about' => 'public/homes#about', as: 'about'

  scope module: :public do
    resources :products, only: [:index, :show]
  end

end
