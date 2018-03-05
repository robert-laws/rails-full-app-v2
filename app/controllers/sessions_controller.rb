class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      # login with OAuth
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # login with username and password
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "You have successfully logged in"
      else
        redirect_to signin_path, alert: "Login failed, please try again"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end