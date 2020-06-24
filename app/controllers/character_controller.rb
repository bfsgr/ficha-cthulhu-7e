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
  end
end
