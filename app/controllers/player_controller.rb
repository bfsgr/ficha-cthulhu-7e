class PlayerController < ApplicationController
    before_action :authenticate_user, :check_for_dm, :only => [:home]
    def home
    end

    protected
        def check_for_dm
            if @current_user.is_dm
                redirect_to(:controller => 'master', :action => 'home')
                return false
            else
                return true
            end
        end
end
