class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: {user: StudentSerializer.new(currentUser)}
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            @dailychecklist = Dailychecklist.create(user_id: @user.id, checked_statuses: [])
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Hit Rocks", num_of_boxes: 6)
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Excavate Fossils", num_of_boxes: 4)
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Plant/Harvest Money Tree", num_of_boxes: 2)
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Find Recipe Bottle on Beach", num_of_boxes: 1)
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Furniture From Trees", num_of_boxes: 2)
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Wasps From Trees", num_of_boxes: 5)
            Task.create(dailychecklist_id: @dailychecklist.id, name: "Coins From Trees", num_of_boxes: 10) 
            # Calendar.create(user_id: @user.id)
            token = encode_token(@user)
            render json: { user: UserSerializer.new(@user), jwt: token }
        else 
            render json: { error: @user.errors.full_messages} 
        end
    end

    # def update
    #     @user = User.find(params[:id])
    #     if @user.valid?
    #         @user.update(user_params)
    #         render json: @user
    #     else
    #         render json: { message: @user.errors.full_messages }
    #     end
    # end

    # def destroy
    #     @user = User.find(params[:id])
    #     @user.destroy
    #     render json: { message: "User successfully deleted" }
    # end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
