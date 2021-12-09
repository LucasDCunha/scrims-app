Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search_team', to: 'teams#search_team'
  resources :users, except: %i[index new create]
  resources :teams
  resources :players
  resources :scrims
  resources :team_scrims
end
