class StatsController < ApplicationController
    before_action :authenticate_user, :validate_char
    before_action :stats_not_set, :only => [:new, :create]

    def new
        @stats = Stat.new
    end

    def create
        @stats = Stat.new(stat_params.merge(:character_id => @char.id))
        @stats.save
        render plain: @stats.inspect
    end

    private
    def stat_params
        params.require(:stat).permit(:str, :dex, :app, :int, :pow, :edu, :siz, :con)
    end
end
