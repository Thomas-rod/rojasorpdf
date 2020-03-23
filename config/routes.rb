Rails.application.routes.draw do
  # DEVISE ROUTES
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # DASHBOARD ROUTES
  get '/dashboards', to: 'dashboards#index'
  # DONORS ROUTES
  resources :donors, only: [:index, :show] do
    resources :donations, only: [:show, :update]
  end
  resources :donors, only: :update
  resources :donations, only: :index

  # patch '/donors/:donor_id/donations/:id/edit_donation', to: 'donations#update_fiscal_recip'
  resources :csv_storages do
    collection { post :import }
  end

end
