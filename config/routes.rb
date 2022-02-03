Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  
  get '/search_team', to: 'teams#search_team'

  get '/transfer_team', to: 'teams#transfer_team'
  
  post '/team_transf', to: 'teams#team_transf'

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
  resources :complaints
  resources :messages
  resources :chat_rooms
end
