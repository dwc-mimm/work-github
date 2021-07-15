Rails.application.routes.draw do
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
  }

  root to: 'public/products#top'
  get '/about' => 'public/products#about', as: 'about'

  scope module: :public do
    resources :products, only: [:index, :show]
  end

end
