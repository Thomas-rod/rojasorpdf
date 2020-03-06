Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :donors, only: [:index, :show] do
    resources :donations, only: :show
  end
  resources :donations, only: :index
end
