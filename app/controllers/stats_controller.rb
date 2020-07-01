class StatsController < ApplicationController
    before_action :authenticate_user, :validate_char
    before_action :stats_not_set, :only => [:new, :create]

    def new
        @stats = Stat.new
    end

    def create
    end
end
