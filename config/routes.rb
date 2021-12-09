Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, except: %i[index new create]
  resources :teams
  resources :players
  resources :scrims
  resources :team_scrims
end
