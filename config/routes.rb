Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/bookings/:id/accept', to: 'bookings#accept', as: 'accept'
  get '/bookings/:id/reject', to: 'bookings#reject', as: 'reject'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cameras do
    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [ :index, :accept, :reject, :show, :edit, :update, :destroy ]
end
