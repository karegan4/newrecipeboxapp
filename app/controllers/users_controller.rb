class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        if current_user == User.find_by(id: params[:id])
            @user = User.find_by(id: params[:id])
        else
            redirect_to '/error'
        end
    end

    #display all registered users
    def all
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password_digest)
    end
end