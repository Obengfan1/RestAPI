class Api::V1::UsersController < ApplicationController
  #Get /users
  def index
    @users = User.all
    render json: @users
  end
  #Get /user/:id
  def show
    @user = User.find(params[:id])
    render json: @user

  end
  #Post /user
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render error: {error: 'Unable to create user.'}, status: 400
    end
  end
  #PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: {message: 'User successfully updated.'}, status: 200
    else
      render json: {error: 'Unable to update User.'}, status: 400
    end
  end
  # Delete /user/:id
  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: { message: 'You have deleted User successfully.'}, status: 200
    else
      render json: { error: 'You cannot delete this User.'}, status: 400
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
