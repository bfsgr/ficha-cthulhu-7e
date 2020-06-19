Rails.application.routes.draw do
  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'

  get 'login', to: 'user#login'
  post 'login', to: 'user#login_attempt'
  
  get 'logout', to: 'user#logout'

  get 'player', to: 'player#home'
  get 'master', to: 'master#home'


  get 'newchar', to: 'character#new'
  post 'newchar', to: 'character#create'

end
