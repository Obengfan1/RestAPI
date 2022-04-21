class Api::V1::UsersController < ApplicationController
  #Get /users
  def index
    @users = User.all
    render jason: @users
  end
  #Get /user/:id
  def show
    @user = User.find(params[:id])
    render jason: @user

  end
  #Post /user
  def create
    @user = User.new(user_params)
    if @user.save
      render jason: @user
    else
      render error: {error: 'Unable to create user.'}, status: 400
    end
  end
  #PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render jason: {message: 'User successfully updated.'}, status: 200
    else
      render jason: {error: 'Unable to update User.'}, status: 400
    end
  end
  # Delete /user/:id
  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render jason: { message: 'You have deleted User successfully.'}, status: 200
    else
      render jason: { error: 'You cannot delete this User.'}, status: 400
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
