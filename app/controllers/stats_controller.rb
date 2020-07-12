class StatsController < ApplicationController
    before_action :authenticate_user, :validate_char

    def new
        if not stats_set()
            @stats = Stat.new
        else
            redirect_to '/character/' + @char.id.to_s
        end
    end
    
    def age_limits
        if stats_set() # => generate @stat            
            case @char.age
            when 18..19
                @change = [:str, :siz]
                @must = :edu
                @points = { change: 5, must: 5 }
                @details = { change: ['Força', 'Tamanho'], must: 'Educação' }
            when 20..39
            when 40..49
                @change = [:str, :con, :dex]
                @must = :app
                @points = { change: 5, must: 5 }
                @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
            when 50..59
                @change = [:str, :con, :dex]
                @must = :app
                @points = { change: 10, must: 10 }
                @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
            when 60..69
                @change = [:str, :con, :dex]
                @must = :app
                @points = { change: 15, must: 15 }
                @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
            when 70..79
                @change = [:str, :con, :dex]
                @must = :app
                @points = { change: 20, must: 20 }
                @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
            when 80..89
                @change = [:str, :con, :dex]
                @must = :app
                @points = { change: 25, must: 25 }
                @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
            else
                raise ActionController::RoutingError.new('Invalid age') #should never run
            end
        end
    end

    def create
        if not stats_set()
            @stats = Stat.new(stat_params.merge(:character_id => @char.id))
            if @stats.save
                redirect_to :action => 'age_limits'
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
