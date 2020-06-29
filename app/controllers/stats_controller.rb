class StatsController < ApplicationController
    before_action :authenticate_user, :validate_char, :already_set

    def new
        @stats = Stat.new
        render plain: @char.inspect
    end

    def create
    end

    private
    def already_set
        data = Stat.where(character_id: @char.id)
        if data == [] 
            return true
        else
            return false
        end
    end
end
