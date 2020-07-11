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
                    # Decrease 5pts from STR or SIZ
                    # Advantage in luck setting
                when 20..39
                    # Improve EDU test
                when 40..49
                    # Decrease 5pts from STR, CON, or DEX and also APP.
                    # Two EDU improvement tests
                when 50..59
                    # Decrease 10pts from STR, CON, or DEX and also APP.
                    # Three EDU improvement tests
                when 60..69
                    # Decrease 20pts from STR, CON, or DEX and also -15 APP.
                    # Four EDU improvement tests
                when 70..79
                    # Decrease 40pts from STR, CON, or DEX and also -20 APP.
                    # Four EDU improvement tests 
                when 80..89
                    # Decrease 80pts from STR, CON, or DEX and also -25 APP.
                    # Four EDU improvement tests 
                else
                    #panic!
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
