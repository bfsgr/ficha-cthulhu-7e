class UserController < ApplicationController

  before_action :save_login_state, :only => [:login, :login_attempt, :create]
  # GET /signup
  def new
    @user = User.new
  end

  # POST /signup 
  def create
    @user = User.new(create_user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :controller => 'session', :action => 'home'
    else
      render "new"
    end

  end
  # GET /login
  def login 
    @hasPassed = true
  end
  
  # POST /login
  def login_attempt
    login_user = User.authenticate(login_params)
    if login_user
      session[:user_id] = login_user.id
      redirect_to :controller => 'session', :action => 'home'
    else 
      @hasPassed = false
      render 'login'
    end
  end

  # GET /logout
  def logout 
    session[:user_id] = nil
    redirect_to :action => 'login'
  end


  private 
  def create_user_params
      params.require(:user).permit(:invite, :username, :password, :password_confirmation)
  end

  def login_params
      params.require(:login).permit(:username, :password)
  end

end
