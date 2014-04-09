class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if session[:user_id] != @user.id
      redirect_to root_url, notice: "No way!"
    end
  end

  def create
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:rePassword]
    user.save
    session[:user_id] = user.id
    redirect_to user_url(user.id), notice: "Welcome, #{user.name}"
  end

end
