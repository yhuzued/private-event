Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :reservations, only: [:new]
  end
  root "events#index"
end
