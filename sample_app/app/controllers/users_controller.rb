class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :authorized_user, only: %i[edit update]
  # before_action :only_admin,        only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_permitted_params)
    if @user.save
      # log_in @user
      @user.send_activation_mail
      flash[:success] = 'Check your mail to activate your account'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_permitted_params)
      flash[:success] = 'Profile updated successfully'
      redirect_to @user
    else
      render :edit
    end
  end

  def authorized_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
    # flash[:danger] = "Permission Denied"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'User deleted'
    redirect_to users_url, status: :see_other
  end

  private

  def user_permitted_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
