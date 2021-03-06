class ApplicationController < ActionController::Base
    protected 
        def authenticate_user
            if session[:user_id]
                @current_user = User.find(session[:user_id])
                return true	
            else
                redirect_to(:controller => 'user', :action => 'login')
                return false
            end
        end

        def save_login_state
            if session[:user_id]
                redirect_to(:controller => 'player', :action => 'home')
                return false
            else
                return true
            end
        end

        def validate_char
            char_id = session[:character_id]
            
            if char_id
                @char = Character.find(session[:character_id])
                if @current_user.id == @char.user_id
                    return @char
                else
                    return false
                end
            else
                raise ActionController::RoutingError.new('No character set')
            end

        end

        def stats_set
            @stat = @char.stat
            if @stat.nil?
                return false
            else
                return @stat
            end
        end

        def stats_done
            if stats_set()
                return @stat.done
            end
        end
end
