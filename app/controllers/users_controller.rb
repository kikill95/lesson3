class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit!)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def sign_in
    login = params[:user][:login]
    email = params[:user][:email]
    password = params[:user][:password_digest]
    @user = User.find_by(login: login, email: email, password_digest: password)
    if @user
      render :sign_in
    end
  end

  def destroy
  end
end
