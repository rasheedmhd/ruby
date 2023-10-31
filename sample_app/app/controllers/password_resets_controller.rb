class PasswordResetsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by(email: params[:password_reset][:email].downcase)
      if @user
        print "found user"
        @user.create_password_reset_digest
        print "password digest created"
        @user.send_password_reset_mail
        print "password reset mail sent"
        flash[:success] = "Password reset email sent"
        redirect_to root_url
        print "redirected to root url"
      else
        flash[:danger] = "Email does not exist"
        redirect_to root_url
      end
  end

  def edit
  end

end
