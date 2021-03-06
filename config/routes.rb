Rails.application.routes.draw do
  devise_for :users
  # ROOT
  root to: 'cars#index'

  # ---- ADDITONNAL ROUTES -----------------------#
  get "my_cars", to: "cars#my_cars"
  get "filter_search", to: "cars#filter_search"
  get "my_bookings", to: "bookings#my_bookings"
  get "my_demands", to: "bookings#my_demands"
  get "show_demand", to: "bookings#show_demand"
  # ----------------------------------------------- #
  resources :products do
    collection do
      get :cars
    end
  end

  resources :cars do
    # resources :products
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
