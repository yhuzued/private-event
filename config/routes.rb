Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :reservations, only: [:new, :create, :destroy]
  end
  root "events#index"
end
