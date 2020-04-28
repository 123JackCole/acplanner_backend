class Api::V1::CollectablesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]

    def index
        @collectables = Collectable.all
        render json: @collectables
    end

    def show
        @collectable = Collectable.find_by(name: params[:id])
        render json: @collectable
    end

    def create
        @collectable = Collectable.new(collectable_params)
        if @collectable.valid?
            @collectable.save
            render json: { collectable: collectableserializer.new(@collectable) }
        else 
            render json: { message: @collectable.errors.full_messages} 
        end
    end

    private

    def collectable_params
        params.require(:collectable).permit(:name)
    end
end
