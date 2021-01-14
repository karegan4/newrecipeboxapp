class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
      @user = User.find_by(email: params[:user][:email])
  
      if @user
        if @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        end
      else
        redirect_to root_path
      end
    end


  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    puts "You have successfully logged in"
    redirect_to user_path(@user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end