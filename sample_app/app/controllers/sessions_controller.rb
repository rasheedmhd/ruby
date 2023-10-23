class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(password: params[:session][:password])
      # log in the login and redirect to the user's show page
      else
        # flash[:failed] = "User log in failed!"
        render :new
      end
  end

  def destroy
  end

end
