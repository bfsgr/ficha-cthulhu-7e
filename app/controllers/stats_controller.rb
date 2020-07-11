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
            if @stats.save
                case @char.age
                when 18..19
                    #Decrease 5pts from STR or SIZ
                when 20..39
                    # Improve EDU test
                when 40..49
                when 50..59
                when 60..79
                when 80..89
                else
                end
            end
            
        else
            redirect_to '/character/' + @char.id.to_s
        end
    end

    private
    def stat_params
        params.require(:stat).permit(:str, :dex, :app, :int, :pow, :edu, :siz, :con)
    end
end
