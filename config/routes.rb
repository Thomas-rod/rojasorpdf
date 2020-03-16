Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get '/dashboards', to: 'dashboards#index'
  resources :donors, only: [:index, :show] do
    resources :donations, only: :show
  end
  resources :donations, only: :index
end
