Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :reservations, only: [:new, :create, :destroy]
  end
  root "events#index"
  get '/myevents', to: 'events#myevent'
  get '/past_events', to: 'events#past_event'
  get '/future_events', to: 'events#future_event'
end
