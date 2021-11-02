Rails.application.routes.draw do
  root 'home#home'
  devise_for :users, path: '/', controllers: {
    confirmations: 'confirmations',
    passwords: 'passwords',
    registrations: 'registrations',
    sessions: 'sessions',
    unlocks: 'unlocks'
  }, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'confirmation',
    registration: 'users',
    unlock: 'unlock'
  }

  devise_scope :user do
    get '/signup', to: 'registrations#new'
    get '/settings', to: 'registrations#edit'
    get '/users/:id', to: 'registrations#show', as: 'user_profile'
    get '/users/:id/microposts', to: 'registrations#microposts', as: 'user_microposts'
  end

  resources :microposts
end
