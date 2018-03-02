class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if request.env["omniauth.auth"]
      # login with OAuth
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      oauth_username = request.env["omniauth.auth"]["info"]["email"].split("@")[0]
      if @user = User.find_by(email: oauth_email)
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "You have successfully logged in"
      else
        @user = User.new(username: oauth_username, email: oauth_email, password: SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "You have successfully logged in"
        else
          raise user.errors.full_messages.inspect
        end
      end
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
