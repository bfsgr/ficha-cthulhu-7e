Rails.application.routes.draw do
  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'

  get 'login', to: 'user#login'
  post 'login', to: 'user#login_attempt'
  
  get 'logout', to: 'user#logout'

  get 'home', to: 'session#home'

end
