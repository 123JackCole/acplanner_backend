class Api::V1::TasksController < ApplicationController
    skip_before_action :authorized

    def index
        @tasks = Task.all
        render json: @tasks
    end

    def show
        @task = Task.find_by(name: params[:id])
        render json: @task
    end

    def create
        @task = Task.new(task_params)
        if @task.valid?
            @task.save
            render json: { task: TaskSerializer.new(@task) }
        else 
            render json: { message: @task.errors.full_messages} 
        end
    end

    private

    def task_params
        params.require(:task).permit(:dailychecklist_id, :name, :num_of_boxes)
    end

end
