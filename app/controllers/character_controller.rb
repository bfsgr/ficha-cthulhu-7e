class CharacterController < ApplicationController
	before_action :authenticate_user
	before_action :validate_char, :only => [:remove]

	def new
		@char = Character.new
	end

	def show
		session[:character_id] = params[:id]
		if not validate_char()
			redirect_to :controller => 'player', :action => 'home'
		elsif not stats_set()
			redirect_to :controller => 'stats', :action => 'new'
		elsif not stats_done()
			redirect_to :controller => 'stats', :action => 'age_limits'
		end
	end

	def edit
	end

	def list
	end

	def remove
		if @char.destroy
			redirect_to :controller => 'player', :action => 'home'
		else
			redirect_to @char
		end 
	end

	def create
		@char = Character.new(create_char_params.merge(:user_id => @current_user.id))
		if @char.save
			session[:character_id] = @char.id
			redirect_to :controller => 'stats', :action => 'new'
		else
			render 'new'
		end
	end

	private 
	def create_char_params
		params.require(:character).permit(:name, :ocupation, :birth_place, :mental_illnesses, :age, :sex)
	end


end
