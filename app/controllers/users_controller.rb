class UsersController < ApplicationController

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
  if @user.update_attributes(params[:user])
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

