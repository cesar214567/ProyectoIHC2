class JobController < ApplicationController
    def index
        data = JobPositionRequirement.generate
        render json: data
    end
end
