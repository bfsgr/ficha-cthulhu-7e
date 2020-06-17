class MasterController < ApplicationController
    before_action :authenticate_user, :check_for_dm, :only => [:home]
    def home
    end

    protected
    def check_for_dm
        if @current_user.is_dm
            return true
        else
            redirect_to(:controller => 'player', :action => 'home')
            return false
        end
    end
end
