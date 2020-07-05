class StatsController < ApplicationController
    before_action :authenticate_user, :validate_char

    def new
        if stats_not_set()
            @stats = Stat.new
        else
            redirect_to '/character/' + @char.id.to_s
        end
    end

    def create
        if stats_not_set()
            @stats = Stat.new(stat_params.merge(:character_id => @char.id))
            @stats.save
            render plain: @stats.inspect
        else
            redirect_to '/character/' + @char.id.to_s
        end
    end

    private
    def stat_params
        params.require(:stat).permit(:str, :dex, :app, :int, :pow, :edu, :siz, :con)
    end
end
