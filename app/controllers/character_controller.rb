class CharacterController < ApplicationController
	before_action :authenticate_user
	before_action :validate_char, :only => [:show]

	def new
		@char = Character.new
	end

	def show
		render plain: @char.inspect
	end

	def edit
	end

	def list
	end

	def remove
	end

	def create
		@char = Character.new(create_char_params.merge(:user_id => @current_user.id))
		if @char.save
			redirect_to '/setstat/' + (@char.id).to_s
		else
			render 'new'
		end
	end

	private 
	def create_char_params
		params.require(:character).permit(:name, :ocupation, :birth_place, :mental_illnesses, :age, :sex)
	end


end
