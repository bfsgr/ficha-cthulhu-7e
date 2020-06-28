class CharacterController < ApplicationController
  before_action :authenticate_user
  
  def new
    @char = Character.new
  end

  def edit
  end

  def list
  end

  def remove
  end

  def create
    @char = Character.new(create_char_params.merge(:player_id => @current_user.id))
    render plain: @char.inspect
  end

  private 
  def create_char_params
      params.require(:character).permit(:name, :ocupation, :birth_place, :mental_illnesses, :age, :sex)
  end
end
