class UsersController < ApplicationController
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end
      
    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
    end

    def create
        user = User.find_or_create_by(id: params[:user_id])
        render json: UserSerializer.new(user)
        # if review.save
        #     render json: UserSerializer.new(user).to_serialized_json
        # end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end
