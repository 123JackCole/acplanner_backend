class Api::V1::FossilsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create] # Add create after index to seed

    def index
        @fossils = Fossil.all
        render json: @fossils
    end

    # def show
    #     @fossil = Fossil.find_by(name: params[:id])
    #     render json: @fossil
    # end

    def create
        @fossil = Fossil.new(fossil_params)
        if @fossil.valid?
            @fossil.save
            render json: { fossil: FossilSerializer.new(@fossil) }
        else 
            render json: { message: @fossil.errors.full_messages} 
        end
    end

    private

    def fossil_params
        params.require(:fossil).permit(:collectable_id, :name, :image, :scientific_name, :sections, :period, :length, :price)
    end
end
