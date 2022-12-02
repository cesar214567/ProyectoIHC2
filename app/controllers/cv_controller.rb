class CvController < ApplicationController
    def index
        data = Cv.generate_cv
        render json: data
    end
end
