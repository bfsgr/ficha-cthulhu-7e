Rails.application.routes.draw do
  root 'user#login'
  
  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'

  get 'login', to: 'user#login'
  post 'login', to: 'user#login_attempt'
  
  get 'logout', to: 'user#logout'

  get 'player', to: 'player#home'
  get 'master', to: 'master#home'

  get 'newchar', to: 'character#new'
  post 'newchar', to: 'character#create'

  post 'rmchar', to: 'character#remove' 
  
  get 'character/:id', to: 'character#show', as: 'character'

  get 'setstat', to: 'stats#new'
  post 'setstat', to: 'stats#create'

  get 'skills', to: "skill#entrypoint"

  get 'agelimits', to: "stats#age_limits"
  post 'agelimits', to: "stats#new_points"
end
