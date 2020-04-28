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
            # Calendar.create(user_id: @user.id)
            @user.save
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
