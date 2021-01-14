class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            @user.save
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        if current_user
            @user = User.find_by(id: params[:id])
        else
            redirect_to root_path
        end

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end