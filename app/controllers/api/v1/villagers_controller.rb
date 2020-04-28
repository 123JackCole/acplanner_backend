class Api::V1::VillagersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create] # Add create after index to seed

    def index
        @villagers = Villager.all
        render json: @villagers
    end

    # def show
    #     villager = Villager.find_by(name: params[:id])
    #     render json: villager
    # end

    def create
        @villager = Villager.new(villager_params)
        if @villager.valid?
            @villager.save
            render json: { villager: VillagerSerializer.new(@villager) }
        else 
            render json: { message: @villager.errors.full_messages} 
        end
    end

    private

    def villager_params
        params.require(:villager).permit(:name, :image, :quote, :gender, :personality, :species, :birthday, :sign, :phrase, :clothes, :picture, :siblings, :goal, :fear, :favclothing, :leastfavclothing, :favcolor)
    end
end
