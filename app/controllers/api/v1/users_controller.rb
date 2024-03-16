class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
        render json: User.all
    end
    
    def show
        render json: User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        # @user.role = 'user' 
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
    
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end

end
