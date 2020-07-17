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
            @status = set_limits(@char)
        end
    end

    def new_points
        if stats_set()
            render plain: newstats_params
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

    def newstats_params
        change_set = set_limits(@char)
        params.require(:newpoints).permit(change_set.symbols[:change])
    end

    def set_limits(char)
        case char.age
        when 18..19
            return AgeLimit.new(5, false)
        when 20..39
        when 40..49
            return AgeLimit.new(5, true)
        when 50..59
            return AgeLimit.new(10, true)
        when 60..69
            return AgeLimit.new(15, true)
        when 70..79
            return AgeLimit.new(20, true)
        when 80..89
            return AgeLimit.new(25, true)
        else
            raise ActionController::RoutingError.new('Invalid age') #should never run
        end
    end

end

class AgeLimit
    attr_reader :symbols, :details, :points, :colors
    def initialize(value, default)
        if default
            @symbols = { change: [:str, :con, :dex], must: [:app] }
            @points = value
            @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
            @colors = { change: ['bg-danger', 'bg-warning', 'bg-primary'], must: 'bg-info' }
        else
            @symbols = { change: [:str, :siz], must: [:edu] }
            @points = value
            @details = { change: ['Força', 'Tamanho'], must: 'Educação' }
            @colors = { change: ['bg-danger', 'bg-orange'], must: 'bg-pink' }
        end
    end
end
