class StatsController < ApplicationController
    before_action :authenticate_user, :validate_char
    before_action :is_done, :only => [:age_limits, :new_points]

    def new
        if not stats_set()
            @stats = Stat.new
        else
            redirect_to '/character/' + @char.id.to_s
        end
    end
    
    def age_limits
        @change = Stat.new()


        if stats_set() and not (@char.age >= 20 and @char.age <= 39) # => generate @stat            
            @status = set_limits
        else 
            @stat.update(:done => true)
            redirect_to '/character/' + @char.id.to_s
        end
    end

    def new_points
        if stats_set()
            @change = Stat.new()
            newstats_params()
            new_stat = 0
            old_stat = 0

            @status.symbols[:change].each do |s|
                old_stat += @stat[s]
                new_stat += params[:newpoints][s].to_i
            end

            must = @status.symbols[:must][0]

            if old_stat-new_stat == @status.points 
                improve_edu()

                if @stat.update(newstats_params.merge(must => @stat[must]-@status.points, :done => true)) 
                    redirect_to '/character/' + @char.id.to_s
                else 
                    render plain: @stat.errors.inspect
                end
            else 
                @change.errors[:base] << "The new points do not meet the criteria"
                render 'age_limits'
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

    def newstats_params
        @status = set_limits
        params.require(:newpoints).permit(@status.symbols[:change])
    end

    def set_limits
        case @char.age
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

    def improve_edu
        case @char.age
        when 18..19
        when 20..39
            @stat.improve_edu(1)
        when 40..49
            @stat.improve_edu(2)
        when 50..59
            @stat.improve_edu(3)
        when 60..69
            @stat.improve_edu(4)
        when 70..79
            @stat.improve_edu(4)
        when 80..89
            @stat.improve_edu(4)
        else
            raise ActionController::RoutingError.new('Invalid age') #should never run
        end
    end

    def is_done
        if stats_set()
            if @stat.done
                redirect_to '/character/' + @char.id.to_s
            else 
                return false
            end
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
