class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(password: params[:session][:password])
      # log in the login and redirect to the user's show page
      else
        # flash.now[:danger] = "Invalid email or password"
        flash[:danger] = "Invalid email or password"
        render :new
      end
  end

  def destroy
  end

end
