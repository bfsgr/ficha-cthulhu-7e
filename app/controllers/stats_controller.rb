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
                @status = AgeLimit.new(5, false)
            when 20..39
            when 40..49
                @status = AgeLimit.new(5, true)
            when 50..59
                @status = AgeLimit.new(10, true)
            when 60..69
                @status = AgeLimit.new(15, true)
            when 70..79
                @status = AgeLimit.new(20, true)
            when 80..89
                @status = AgeLimit.new(25, true)
            else
                raise ActionController::RoutingError.new('Invalid age') #should never run
            end
        end
    end

    def new_points
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

class AgeLimit
    attr_reader :symbols, :details, :points
    def initialize(value, default)
        if default
            @symbols = { change: [:str, :con, :dex], must: [:app] }
            @points = value
            @details = { change: ['Força', 'Constituição', 'Destreza'], must: 'Aparência' }
        else
            @symbols = { change: [:str, :siz], must: [:edu] }
            @points = value
            @details = { change: ['Força', 'Tamanho'], must: 'Educação' }
        end
    end
end
