class Api::V1::DailychecklistsController < ApplicationController
    skip_before_action :authorized

    def index
        @dailychecklists = Dailychecklist.all
        render json: @dailychecklists
    end

    def show
        @dailychecklist = Dailychecklist.find_by(name: params[:id])
        render json: @dailychecklist
    end

    def create
        @dailychecklist = Dailychecklist.new(dailychecklist_params)
        if @dailychecklist.valid?
            @dailychecklist.save
            render json: { dailychecklist: DailychecklistSerializer.new(@dailychecklist) }
        else 
            render json: { message: @dailychecklist.errors.full_messages} 
        end
    end

    private

    def dailychecklist_params
        params.require(:dailychecklist).permit(:dailychecklist_id, :name)
    end
end
