Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get '/search_team', to: 'teams#search_team'

  post '/create_scrim', to: 'invites#create_scrim'

  resources :users, except: %i[index new create]
  resources :teams
  resources :players
  resources :scrims
  resources :team_scrims
  resources :favorites
  resources :invites
  resources :invite_teams
  resources :evaluations
end
