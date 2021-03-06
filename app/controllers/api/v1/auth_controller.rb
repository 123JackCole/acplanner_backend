class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: auth_params[:username])
        if user && user.authenticate(auth_params[:password])
            token = encode_token(user)
            render json: { user: UserSerializer.new(user), jwt: token }
        else
            render json: { error: 'User could not be found' }, status: 401
        end
    end

    def show
        user = User.find_by(id: user_id)
        if logged_in?
            render json: { id: user.id, username: user.username }
        else
            render json: {error: 'No user could be found'}, status: 401
        end
    end

    def auth_params
        params.require(:auth).permit(:username, :password)
    end

end