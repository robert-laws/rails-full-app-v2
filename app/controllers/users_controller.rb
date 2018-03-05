class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @addresses = @user.addresses.build
    number = params["dog_count"].to_i
    @dogs = number.times { @user.dogs.build }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user), notice: "Your account was successfully created. Please take a moment to add some additional information"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Your profile has been updated successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, addresses_attributes: [:street_1, :street_2, :city, :state, :zip_code, :user_id], dogs_attributes: [:name, :breed, :age, :user_id])
  end
end