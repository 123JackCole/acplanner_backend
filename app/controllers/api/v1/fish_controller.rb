class Api::V1::FishController < ApplicationController
    skip_before_action :authorized, only: [:index, :create] # Add create after index to seed

    def index
        @fishes = Fish.all
        render json: @fishes
    end

    # def show
    #     @fish = Fish.find_by(name: params[:id])
    #     render json: @fish
    # end

    def create
        @fish = Fish.new(fish_params)
        if @fish.valid?
            @fish.save
            render json: { fish: FishSerializer.new(@fish) }
        else 
            render json: { message: @fish.errors.full_messages} 
        end
    end

    private

    def fish_params
        params.require(:fish).permit(:collectable_id, :name, :image, :scientific_name, :family, :time_year, :time_day, :location, :size, :rarity, :price, :shadow)
    end
end
