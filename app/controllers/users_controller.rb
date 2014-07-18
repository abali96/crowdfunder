class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.all
    @comment = @user.comments.build
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, :notice => "Signed up!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to [:my, :campaigns], notice: "User Info Updated!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end

