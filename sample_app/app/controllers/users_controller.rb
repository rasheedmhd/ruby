class UsersController < ApplicationController

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
          flash[:success] = "Welcome to my Sample App"
          # handle successful save
          redirect_to @user
      else
        render "new"
      end
  end

  private
    def user_permitted_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
