class AdminController < ApplicationController
    def index
        authorize! :manage, @Letter
    end
end
