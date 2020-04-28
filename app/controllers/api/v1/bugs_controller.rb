class Api::V1::BugsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create] # Add create after index to seed

    def index
        @bugs = Bug.all
        render json: @bugs
    end

    # def show
    #     @bug = Bug.find_by(name: params[:id])
    #     render json: @bug
    # end

    def create
        @bug = Bug.new(bug_params)
        if @bug.valid?
            @bug.save
            render json: { bug: BugSerializer.new(@bug) }
        else 
            render json: { message: @bug.errors.full_messages} 
        end
    end

    private

    def bug_params
        params.require(:bug).permit(:collectable_id, :name, :image, :scientific_name, :family, :time_year, :time_day, :location, :size, :rarity, :price)
    end
end
