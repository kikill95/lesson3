class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit!)
    if @user.save
      Session.create(api_key: @user.id)
      session[:api_key] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def sign_in
    if session[:api_key]
      render :sign_in
    else
      login = params[:user][:login]
      email = params[:user][:email]
      password = params[:user][:password_digest]
      @user = User.find_by(login: login, email: email, password_digest: password)
      if @user
        session[:api_key] = @user.id
        render :sign_in
      end
    end
  end

  def sign_out
    # binding.pry
    session.clear
    redirect_to root_path
  end

  def destroy
  end
end
