class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # log in the login and redirect to the user's show page
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        flash[:success] = "You have successfully logged in"
        redirect_to user
      else
        # flash.now[:danger] = "Invalid email or password"
        flash[:danger] = "Invalid email or password"
        render :new
      end
  end

  def destroy
      log_out if logged_in?
      redirect_to root_url
  end

end
