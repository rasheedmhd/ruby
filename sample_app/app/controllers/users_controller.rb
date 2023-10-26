class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :authorized_user, only: [:edit, :update]

  def new
      @user = User.new
  end

  def show
      @user = User.find(params[:id])
      # debugger
  end

  def create
      # @user = User.new(params[:user]) # incomplete
      @user = User.new(user_permitted_params)
      if @user.save
          log_in @user
          flash[:success] = "Welcome to my Sample App"
          # handle successful save
          redirect_to @user
      else
        render "new"
      end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_permitted_params)
          # Handle successful update
          flash[:success] = "Profile updated successfully"
          redirect_to @user
      else
        render :edit
      end
  end

  def logged_in_user
    unless logged_in?
        store_location
        flash[:danger] = "Please you must login first to visit this page"
        redirect_to login_url
    end
  end

  def authorized_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
      # flash[:danger] = "Permission Denied"
  end

  private
    def user_permitted_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
